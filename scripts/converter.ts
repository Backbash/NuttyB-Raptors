import base64url from 'base64url'
import path from 'path'
import { promises as fs } from 'fs'
const clipboardy = import('clipboardy')

const luamin = require('luamin')
const luafmt = require('lua-format')

const defaultTweakResult = {tweakKey: '', tweakValue: '', isChanged: false, order: 0}

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
  tweakKey: string;
  tweakValue: string;
  isChanged: boolean;
  order: number;
}

async function processDirectory(
  srcDir: string,
  destDir: string,
  toFileExtension: string,
  convertFunction: (
    srcPath: string,
    destPath: string,
    tweakKey: string,
    order: number
  ) => Promise<tweakResult>,
) {
  // Ensure destination directory exists
  await fs.mkdir(destDir, { recursive: true }).catch(() => {});

  const entries = await fs.readdir(srcDir, { withFileTypes: true });

  console.log(
    `Processing ${entries.length} entries from ${srcDir} to ${destDir}...`,
  );

  let conversions: Promise<tweakResult>[] = [];
  let orderIndex = 0;

  for (const entry of entries) {
    const srcPath = path.join(srcDir, entry.name);

    if (entry.isDirectory()) {
      // Create corresponding directory in destination
      const nestedDestDir = path.join(destDir, entry.name);
      await fs.mkdir(nestedDestDir, { recursive: true }).catch(() => {});

      // Use the directory name as the tweakKey for all files in this directory
      const tweakKey = entry.name;

      // Process files in this subdirectory
      const subEntries = await fs.readdir(srcPath, { withFileTypes: true });
      for (const subEntry of subEntries) {
        if (!subEntry.isDirectory()) { // Only process files, not nested directories
          const subSrcPath = path.join(srcPath, subEntry.name);
          const destBaseFileName = subEntry.name.split('.').slice(0, -1).join('.');
          const subDestPath = path.join(
            nestedDestDir,
            `${destBaseFileName}.${toFileExtension}`,
          );

          conversions.push(
            convertFunction(subSrcPath, subDestPath, tweakKey, orderIndex++),
          );
        }
      }
    } else {
      // Process file in the root directory
      const destBaseFileName = entry.name.split('.').slice(0, -1).join('.');
      const destPath = path.join(
        destDir,
        `${destBaseFileName}.${toFileExtension}`,
      );

      conversions.push(
        convertFunction(srcPath, destPath, entry.name.split('.')[0], orderIndex++),
      );
    }
  }

  const results = await Promise.all(conversions);

  return results.sort((a, b) => a.order - b.order);
}

async function base64UrlFileToLua(
  srcPath: string,
  destPath: string,
  tweakKey: string,
  order: number
): Promise<tweakResult> {
  try {
    const srcContent = (await fs.readFile(srcPath, 'utf-8')).trim()
    if (!srcContent)
      return Promise.resolve({...defaultTweakResult, order})

    const decoded =
      (destPath.includes('units') ? 'return ' : '') + base64url.decode(srcContent)
    let tweakValue = luafmt
      .Beautify(decoded, {
        RenameVariables: false,
        RenameGlobals: false,
        SolveMath: false,
      })
      .replace(/^[\s\S]*?\]\]\s*/, '')
      .replace(/;\s*\n/g, '\n')
      .replace(/"/g, "'")

    tweakValue += tweakValue.endsWith('\n') ? '' : '\n'

    const destContent = await fs.readFile(destPath, 'utf-8')

    return fs
      .writeFile(destPath, tweakValue, 'utf-8')
      .then(() => {
        return {
          tweakKey,
          tweakValue,
          isChanged: destContent !== tweakValue,
          order
        }
      })
      .catch((err) => {
        console.error(err)
        return {
          tweakKey,
          tweakValue,
          isChanged: true,
          order
        }
      })
  }
  catch (err) {
    console.error(err)
    return {...defaultTweakResult, order}
  }
}

async function luaFileToBase64Url(
  srcPath: string,
  destPath: string,
  tweakKey: string,
  order: number
) {
  const content = (await fs.readFile(srcPath, 'utf-8')).trim()
  if (!content)
    return Promise.resolve({...defaultTweakResult, order})

  const firstLine = content.split('\n')[0];
  const tweakComment = /^\s*--.*/.test(firstLine) ? firstLine+'\n' : '';

  let minified
  try {
  minified = tweakComment + (destPath.includes('units')
    ? luamin.minify(content).replace(/.*?(\{.*)/, '$1')
    : luamin.minify(content))
  } catch (err) {
    console.log(srcPath, 'content:', content.slice(0, 200), '...');
    console.error(err)
    throw err
  }

  const destContent = await fs.readFile(destPath, 'utf-8').catch(() => null);

  const tweakValue = base64url.encode(minified)

  return fs
    .writeFile(destPath, tweakValue, 'utf-8')
    .then(() => {
      return {
        tweakKey,
        tweakValue: tweakValue,
        isChanged: destContent !== tweakValue,
        order
      }
    })
    .catch((err) => {
      console.error(err)
      return {
        tweakKey,
        tweakValue,
        isChanged: true,
        order
      }
    })
}

async function main() {
  if (process.argv.length <= 2) {
    console.error('Usage: ts-node converter.ts ')
    return
  }
  if (process.argv[2] === 'b64tolua') {
    await base64ToLua()
  } else if (process.argv[2] === 'luatob64') {
    const results = await luaToBase64();

    (await clipboardy).default.writeSync(
      results
        .filter(({ isChanged }) => isChanged)
        .map(({ tweakKey, tweakValue }) => `!bset ${tweakKey} ${tweakValue}`)
        .join('\n')
    );
  } else {
    console.error('Usage: ts-node ./scripts/converter.ts b64tolua|luatob64')
  }
}

main()
