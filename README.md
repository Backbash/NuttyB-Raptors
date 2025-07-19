# Requirements

- [Docker](https://www.docker.com/products/docker-desktop/)
- [make](https://scoop.sh/scoopinstaller-dev.github.io/#/apps?q=make&id=c43ff861c0f1713336e5304d85334a29ffb86317)

# Usage

This command links the local [base64url folder] and [lua folder](lua) folders, builds docker container and processes the tweaks from the lua folder into the base64url and copies the spads commands to clipboard:

```shell
make b64
```

Several other commands (targets) are in the [Makefile](Makefile)

Same as `make b64` but to other way around. Converts base64url tweaks back into lua and tries format it somewhat similarly:

```shell
make lua
```

# Release new version to [The Paste Machine Spreadsheet](https://docs.google.com/spreadsheets/d/1QSVsuAAMhBrhiZdTihVfSCwPzbbZWDLCtXWP23CU0ko)

1. Copy the Sheet within the Spreadsheet. As a backup. Can even copy the whole Spreadsheet if changing more.
2. Execute `make b64` in the nuttyb repo (what is done above).
3. Paste your clipboard on top of the tweaks column in the data sheet (probably column C) in the sheet.

# Todo

- Make web app
