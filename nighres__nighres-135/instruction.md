# Issue

**Title:** fixing some bugs of alpha merge

## Description

- Change in line in build.sh prevented nighres from seeing nighresjava module, reversed
- Change in _fname_4saving made example fail (when no file extension is given function fails)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `37e7341c864e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.