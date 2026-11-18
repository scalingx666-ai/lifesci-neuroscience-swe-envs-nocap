# Issue

**Title:** Reinstates classify.py. Refactors test/utils funcs.

## Description

One part of #511. 

1. test/utils.py was refactored to work with checking the outputs of test data that aren't in {}plane{}chan format. 
2. Added back classify.py with the classify func as requested [here](https://github.com/MouseLand/suite2p).
3. Just check the cell/non-cell results in our tests (not probabilities).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4d83aa75b023`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.