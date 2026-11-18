# Issue

**Title:** Fix copy plot, add log-log PSD, Meryem's hotfix

## Description

- Fixed issue where the channels in MainGUI are deleted from generating a copy plot
- Fixed issue where the channel and SD handles are rewritten to that of the copy plot
- Added Log-Log Options to MainGUI menu

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4c58a6a68d59`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.