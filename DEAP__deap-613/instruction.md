# Issue

**Title:** fixed extra x^2 in docstring of rastrigin_scaled

## Description

This is a minor fix which rectifies a typo in the docstring for `deap.benchmarks.rastrigin_scaled`. On the website, note the extra x^2 in the formatted equation:
![image](https://user-images.githubusercontent.com/37961031/148003833-a4f9144b-6332-485d-973b-bd6bf4eec76d.png)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2372fd2e4fdc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.