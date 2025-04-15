%:
	@:

.PHONY: install

ifeq ($(OS),Windows_NT)
		NODE_PLUGIN_CMD = ""
		NODE_INSTALL_CMD = vfox install nodejs@23
		NODE_USE_CMD = vfox use nodejs@23 --project
else
		NODE_PLUGIN_CMD = asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
		NODE_USE_CMD = ""
		NODE_INSTALL_CMD = asdf install
endif

PATH_ARG ?= base64url/tweakdefs8.base64url

install:
	$(NODE_INSTALL_CMD)
	$(NODE_USE_CMD)
	npm install -g bun ts-node
	bun install
	bun install -g npm-check-updates

update:
	@bun upgrade
	@bun update -g ts-node
	@npm-check-updates -i
	@bun update

lua:
	@ts-node ./scripts/converter.ts b64tolua

b64:
	@ts-node ./scripts/converter.ts luatob64

b64-updated:
	@ts-node ./scripts/converter.ts luatob64 --clip-updated-only

clipboard-raw:
	@powershell -Command "Get-Content -Path '$(PATH_ARG)' | Set-Clipboard"
