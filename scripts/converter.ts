import base64url from 'base64url'
import path from 'path'
import os from 'os'
import { promises as fs } from 'fs'
import { execSync } from 'child_process'
const clipboardy = import('clipboardy')

const luamin = require('luamin')
const luafmt = require('lua-format')

const defaultTweakResult = {
	tweakKey: '',
	tweakValue: '',
	isChanged: false,
	order: 0,
	oldSize: 0,
	newSize: 0,
}

async function base64ToLua() {
	const base64Dir = path.join(__dirname, '../base64url')
	const luaDir = path.join(__dirname, '../lua')

	await fs.mkdir(luaDir, { recursive: true })

	return processDirectory(base64Dir, luaDir, 'lua', base64UrlFileToLua)
}

async function luaToBase64() {
	const luaDir = path.join(__dirname, '../lua')
	const base64Dir = path.join(__dirname, '../base64url')

	await fs.mkdir(base64Dir, { recursive: true })

	return processDirectory(luaDir, base64Dir, 'base64url', luaFileToBase64Url)
}

type tweakResult = {
	tweakKey: string
	tweakValue: string
	isChanged: boolean
	order: number
	oldSize: number
	newSize: number
}

async function processDirectory(
	srcDir: string,
	destDir: string,
	toFileExtension: string,
	convertFunction: (
		srcPath: string,
		destPath: string,
		tweakKey: string,
		order: number,
	) => Promise<tweakResult>,
) {
	// Ensure destination directory exists
	await fs.mkdir(destDir, { recursive: true }).catch(() => {})

	const entries = await fs.readdir(srcDir, { withFileTypes: true })

	console.log(
		`Processing ${entries.length} entries from ${srcDir} to ${destDir}...`,
	)

	let conversions: Promise<tweakResult>[] = []
	let orderIndex = 0

	for (const entry of entries) {
		const srcPath = path.join(srcDir, entry.name)

		if (entry.isDirectory()) {
			// Create corresponding directory in destination
			const nestedDestDir = path.join(destDir, entry.name)
			await fs.mkdir(nestedDestDir, { recursive: true }).catch(() => {})

			// Use the directory name as the tweakKey for all files in this directory
			const tweakKey = entry.name

			// Process files in this subdirectory
			const subEntries = await fs.readdir(srcPath, { withFileTypes: true })
			for (const subEntry of subEntries) {
				if (!subEntry.isDirectory()) {
					// Only process files, not nested directories
					const subSrcPath = path.join(srcPath, subEntry.name)
					const destBaseFileName = subEntry.name
						.split('.')
						.slice(0, -1)
						.join('.')
					const subDestPath = path.join(
						nestedDestDir,
						`${destBaseFileName}.${toFileExtension}`,
					)

					conversions.push(
						convertFunction(subSrcPath, subDestPath, tweakKey, orderIndex++),
					)
				}
			}
		} else {
			// Process file in the root directory
			const destBaseFileName = entry.name.split('.').slice(0, -1).join('.')
			const destPath = path.join(
				destDir,
				`${destBaseFileName}.${toFileExtension}`,
			)

			conversions.push(
				convertFunction(
					srcPath,
					destPath,
					entry.name.split('.')[0],
					orderIndex++,
				),
			)
		}
	}

	const results = await Promise.all(conversions)

	return results.sort((a, b) => a.order - b.order)
}

async function base64UrlFileToLua(
	srcPath: string,
	destPath: string,
	tweakKey: string,
	order: number,
): Promise<tweakResult> {
	try {
		const srcContent = (await fs.readFile(srcPath, 'utf-8')).trim()
		if (!srcContent) return Promise.resolve({ ...defaultTweakResult, order })

		const decoded =
			(destPath.includes('units') ? 'return ' : '') +
			base64url.decode(srcContent)
		let luaString = luafmt
			.Beautify(decoded, {
				RenameVariables: false,
				RenameGlobals: false,
				SolveMath: false,
			})
			.replace(/^[\s\S]*?\]\]\s*/, '')
			.replace(/;\s*\n/g, '\n')
			.replace(/"/g, "'")

		luaString += luaString.endsWith('\n') ? '' : '\n'

		const destContent = await fs.readFile(destPath, 'utf-8')

		return fs
			.writeFile(destPath, luaString, 'utf-8')
			.then(() => {
				return {
					tweakKey,
					tweakValue: luaString,
					isChanged: destContent !== luaString,
					order,
					oldSize: destContent?.length || 0,
					newSize: luaString.length,
				}
			})
			.catch((err) => {
				console.error(err)
				return {
					tweakKey,
					tweakValue: luaString,
					isChanged: true,
					order,
					oldSize: destContent?.length || 0,
					newSize: luaString.length,
				}
			})
	} catch (err) {
		console.error(err)
		return { ...defaultTweakResult, order }
	}
}

function extractTopComments(content: string) {
	const lines = content.split('\n')
	let commentString = ''

	for (let i = 0; i < Math.min(3, lines.length); i++) {
		const line = lines[i]
		if (/^\s*--.*/.test(line)) {
			commentString += line + '\n'
		} else {
			break
		}
	}

	return commentString
}

async function optimizeAst(luaCode: string): Promise<string> {
	try {
		// Call the Python AST optimizer script
		const astOptimizerPath = path.join(__dirname, 'ast_optimizer.py')
		const optimizedCode = execSync(`python3 ${astOptimizerPath}`, {
			input: luaCode,
			encoding: 'utf-8',
			timeout: 10000, // 10 second timeout
		})

		return optimizedCode.trim()
	} catch (error) {
		console.warn(
			'AST optimization failed, falling back to original code:',
			(error as Error).message,
		)
		return luaCode
	}
}

async function luaFileToBase64Url(
	srcPath: string,
	destPath: string,
	tweakKey: string,
	order: number,
) {
	const content = (await fs.readFile(srcPath, 'utf-8')).trim()
	if (!content) return Promise.resolve({ ...defaultTweakResult, order })

	let minified
	try {
		// const optimizedContent = destPath.includes('defs')
		// 	? await optimizeAst(content)
		// 	: content
		const optimizedContent = content

		minified =
			extractTopComments(optimizedContent) +
			(destPath.includes('units')
				? luamin.minify(optimizedContent).replace(/.*?(\{.*)/, '$1')
				: luamin.minify(optimizedContent))
	} catch (err) {
		console.error(err)
		process.exit(0)
		throw err
	}

	const destContent = await fs.readFile(destPath, 'utf-8').catch(() => null)

	const tweakString = base64url.encode(minified)

	return fs
		.writeFile(destPath, tweakString, 'utf-8')
		.then(() => {
			return {
				tweakKey,
				tweakValue: tweakString,
				isChanged: destContent !== tweakString,
				order,
				oldSize: destContent?.length ?? 0,
				newSize: tweakString.length,
			}
		})
		.catch((err) => {
			console.error(err)
			return {
				tweakKey,
				tweakValue: tweakString,
				isChanged: true,
				order,
				oldSize: destContent?.length ?? 0,
				newSize: tweakString.length,
			}
		})
}

function normalizeLuaFileArgument(input: string): string {
	const base = input.replace(/\.lua$/, '')
	const name = base.startsWith('tweak') ? base : 'tweak' + base
	return name
}

async function main() {
	if (process.argv.length <= 2) {
		console.error('Usage: ts-node converter.ts ')
		return
	}

	let rawExclusiveKey = ''
	if (process.argv.length == 4) {
		const normalized = normalizeLuaFileArgument(process.argv[3].trim())
		if (/^tweak(defs|units)\d*$/.test(normalized)) {
			rawExclusiveKey = normalized
		}
	}

	if (process.argv[2] === 'b64tolua') {
		await base64ToLua()
	} else if (process.argv[2] === 'luatob64') {
		const results = await luaToBase64()

		const clipboardTweaks = results.filter(
			({ tweakKey }) =>
				(rawExclusiveKey && tweakKey === rawExclusiveKey) || !rawExclusiveKey,
		)

		// Output clipboard content to stdout instead of copying to clipboard
		const clipboardContent = clipboardTweaks
			.map(({ tweakKey, tweakValue }) =>
				rawExclusiveKey ? tweakValue : `!bset ${tweakKey} ${tweakValue}`,
			)
			.join('\n')

		// Write clipboard content to a special output stream
		if (process.env.CONTAINER_FILE_OUTPUT) {
			// Write to a file instead of stdout to avoid truncation with large outputs
			// Use /app/clipboard when in container, otherwise use system temp directory
			const clipboardDir =
				process.env.NODE_ENV === 'container' || process.cwd().startsWith('/app')
					? '/app/clipboard'
					: os.tmpdir()
			const clipboardFilePath = path.join(clipboardDir, 'clipboard-content.txt')
			await fs.writeFile(clipboardFilePath, clipboardContent, 'utf-8')
		}

		// if running locally
		if (!process.env.CONTAINER_FILE_OUTPUT) {
			try {
				;(await clipboardy).default.writeSync(clipboardContent)
			} catch (err) {
				console.error('Failed to write to local clipboard')
			}
		}

		results.sort((a, b) => b.newSize - a.newSize)

		const largestByKey = new Map()

		results.forEach((item) => {
			if (!largestByKey.has(item.tweakKey)) {
				largestByKey.set(item.tweakKey, item)
			}
		})

		const filteredResults = Array.from(largestByKey.values())

		console.log(
			`Total size of all tweaks: ${filteredResults.reduce(
				(a, b) => a + b.oldSize,
				0,
			)} -> ${filteredResults.reduce(
				(a, b) => a + b.newSize,
				0,
			)} characters.\n\t${filteredResults
				.map(
					({ newSize, oldSize, tweakKey }) =>
						`${String(oldSize).padStart(5, ' ')} -> ${String(newSize).padStart(
							5,
							' ',
						)} ${tweakKey}`,
				)
				.join('\n\t')}`,
		)
	} else {
		console.error('Usage: ts-node ./scripts/converter.ts b64tolua|luatob64')
	}
}

main()
