# Issue

**Title:** Fix complexity for binary=False and spread=0

## Description

I noticed that the complexity class actually does not work reliably for `spread=0` and `binary=False`, because the length of the complexity histogram is hard-coded to the number of input spiketrains, which limits the maximum complexity that can be detected. Firstly, this is inconsistent with the `spread>0` case in which the histogram always has the minimal length which accommodates the highest entry. Secondly, this may lead to errors, because for `binary=False` the complexity can take arbitrarily high values, so the required size of the histogram cannot be known in advance.

I set the length of the histogram to the minimal value which accommodates the maximal complexity, made the documentation of the `binary` parameter clearer and added tests for `binary=False`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a8aab43c8e5b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.