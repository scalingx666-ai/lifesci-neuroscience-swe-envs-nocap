# Issue

**Title:** Refactor

## Description

- switched to ubuntu 14.04
- trimmed FSL install
- fixed spyder install
- fixed XFCE4 icons
- added cache
- removed CPU throttling
- downgraded the VM RAM to 4Gb
- switched instructions from building the VM to downloading the box from Atlas

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e1ffaebcf4b1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.