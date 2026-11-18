# Issue

**Title:** Chore: Hidden UI in build

## Description

Hide App UI stuff behind an `APP_UI` directive flag.

To enable/disable, add/remove `APP_UI` from the list of directives located in "Project Settings" → "Player" → "Settings for Windows, Mac, Linux" → "Other Settings" → "Script Compilation" → "Scripting Define Symbols"

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `686d4e32ea3a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.