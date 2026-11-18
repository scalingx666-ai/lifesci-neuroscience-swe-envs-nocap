# Issue

**Title:** ENH: properly support PLY export of color-by-solid

## Description

This fixes export of `colorModeSolid` nodes: previously the last-used scalar array would be attached, leading to unexpected colors in the exported data. Now we set a uniform color in the writer.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2e994a398eed`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.