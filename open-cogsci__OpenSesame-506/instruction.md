# Issue

**Title:** Fixed segfault on mac when run with python 3

## Description

Pygame doesn't play nice with multiprocessing's 'forkserver' method of creating new processes, so I changed it to 'spawn'. This mimics windows way of creating new processes and doesn't cause a crash. 

More and more reasons keep piling up to steadily move away from pygame ;)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4a33ace5398e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.