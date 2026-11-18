# Issue

**Title:** FIX: memory leak when calling add_data in loop

## Description

Fixes the memory leak from #88 by removing previously added surfaces from the scene. For some reason the memory usage still slightly increases but much less, i.e., for the following test

https://gist.github.com/mluessi/8658369

the memory goes up to 2.7GB with `num=50, remove=False` and to  600MB with `num=50, remove=True`. But when using  `num=10, remove=True` it needs only 450MB.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1655e0f6f5e3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.