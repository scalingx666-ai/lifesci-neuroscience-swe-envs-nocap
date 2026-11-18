# Issue

**Title:** [FIX] Update install_dependencies.sh to resolve wget dns failure

## Description

Part failure due to dns resolve error. Not sure the root cause, tried 1)  and 2) adding a random sleep, both did not work. Adding retry to wget seems to work. See [this link](https://superuser.com/questions/493640/how-to-retry-connections-with-wget) for parameter settings. Temporary patch.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `614a3d50222c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.