# Issue

**Title:** Change Display Name of App

## Description

**ALL**
* Changes the product name shown with icons, shortcuts (and in macOS Applications) from `Studio` to `neuromore Studio`

**WIN**
* Adds version number to filename of built packages, e.g. `Studio-1.6.4.appxbundle`
* Adds .PDB debug symbols to Github artifact `Binaries`
* Sets the short description in the package to `Your IDE for neuro-tech apps` (equal to macOS Store entry subtitle)
* Copies the binaries to the dist folder before doing anything with it (fixes issues with running repeated `make dist`)

**OSX**
* Adds version number to filename of built packages, e.g. `Studio-1.6.4.pkg`
* Renames unsigned macOS package from `NAME.pkg` to `NAME-unsigned.pkg` and uses without suffix for signed one.
* Cleans up the created dist folder files before creating new one (fixes issues with running repeated `make dist`)

**LINUX**
* Sets `Comment` property of `.desktop` to `Your IDE for neuro-tech apps` (equal to macOS Store entry subtitle)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4c5f4b49b983`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.