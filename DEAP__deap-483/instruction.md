# Issue

**Title:** Fix: scipy and numpy import error for nsga-3 example

## Description

Hey there. First of all thank you for your excellent work.

I've noticed that the [NSGA3 example](https://github.com/DEAP/deap/blob/master/examples/ga/nsga3.py) didn't work on my machine and it was due to a error I would get when calling `deap.benchmarks.tools.igd()` which requires a global variable called `scipy`. 

This variable doesn't exist if the `scipy` import is successful.

I have added the fix and renamed the variables for checking imports of `scipy` and `numpy` to avoid collisions (and confusion) with the original module names.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bc77eface9f4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.