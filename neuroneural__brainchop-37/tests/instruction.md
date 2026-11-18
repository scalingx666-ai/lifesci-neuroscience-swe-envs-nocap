# Issue

**Title:** speed up in sequential

## Description

Backported some changes produced over the weekend here: https://github.com/niivue/niivue-brainchop
Now sequential models such as 104 and 50 class are about 2x faster: the 104 classes model takes 30 seconds on an M1 processor.
Importantly, buffer leak is also fixed

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6a95fd0ef437`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.