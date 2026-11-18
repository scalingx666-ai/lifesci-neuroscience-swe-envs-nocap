# Issue

**Title:** make notebooks more git friendly

## Description

See readme on how to set this up. From now on the notebooks will be staged without outputs and execution numbers. The outputs will remain intact locally though. Diffs on github should look much better now!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `75aeaf502ad3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.