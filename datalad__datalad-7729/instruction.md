# Issue

**Title:** rerun: Include regular commits before first RUNCMD

## Description

Previously, datalad rerun would drop all commits before the first run command when using --since and --onto options. This was caused by a dropwhile() call that discarded all commits until finding one with run information.

This fix removes the dropwhile() logic and instead checks if any run commits exist in the range. All commits (including regular ones before the first RUNCMD) are now properly included for cherry-picking when needed.

Also updates the logic for determining the onto point when an empty string is provided, to handle cases where the first commit might not have run info.

Includes a test case that reproduces the issue and verifies the fix.



🤖 Generated with [Claude Code](https://claude.ai/code)  . This issue came up on the weekly https://github.com/con/solidation report and I decided to give it to claude to address while I was working on something else in "foreground".  I might continue chipping in at similar easy old issues with it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `296ad260ba4c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.