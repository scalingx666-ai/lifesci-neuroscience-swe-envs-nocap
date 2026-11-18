# Issue

**Title:** Modified __main__ script so it works with benchmark script

## Description

I made some edits so that the `__main__.py` script is compatible with the changes in b815340afe02a21f927fc7f7453f2f9ba4ffe30b. I added back the changes involving `add_args` and `parse_args` since the benchmark script relies on those functions to run properly. I've checked and made sure that these changes don't break the GUI.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9de7d7a39a14`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.