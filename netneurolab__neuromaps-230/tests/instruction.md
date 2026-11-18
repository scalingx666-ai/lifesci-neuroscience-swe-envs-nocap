# Issue

**Title:** [FIX] Pass wb_command arguments as a list to handle paths with spaces

## Description

Split the command template on whitespace before filling in paths and run without a shell, so each path stays a single argument even if it contains spaces or shell metacharacters.

This pull request updates the `_surf_to_surf` function in `neuromaps/transforms.py` to improve how external commands are executed for surface transformations. The main change is to make command invocation more robust and secure by avoiding shell execution and properly splitting command arguments.

**Improvements to command execution:**
- Updated the call to `run` so that command strings are split into argument lists before execution, and set `shell=False` to prevent shell injection vulnerabilities and improve reliability.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ec50f9f29731`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.