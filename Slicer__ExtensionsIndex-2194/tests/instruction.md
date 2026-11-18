# Issue

**Title:** ENH: Add more automatic tests

## Description

Move filename checks from bash script executed by CircleCI to Python script executed by GitHub actions for consistency and to be able to run on Windows. Moved the unstable pre-commit json file schema check to the other extension validation checks.

Added tests:
- check that the extension description file name matches the project name in the `CMakeLists.txt` file
- check that the extension can be git cloned
- check that a license file can be found in the extension's repository
- check that extension category is in the allowed list
- check that the extension icon and screenshot URLs are valid image files

Show repository URL, `CMakeLists.txt`, license file in a report in the pull request. This makes quick review of extension submissions a bit easier.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fe7eabcfa4d6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.