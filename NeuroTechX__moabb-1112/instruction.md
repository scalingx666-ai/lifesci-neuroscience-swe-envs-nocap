# Issue

**Title:** Make datasets print their code instead of <...object at 0x...>

## Description

Hey there, new here. Thanks for this project!

I was running through the tutorial examples to get familiar with moabb, and it got a bit hard for me to scan with the printed objects. Small fix: added a __repr__ to BaseDataset that returns the dataset's code, so they show up as BNCI2014-001 instead. This also tidies up the paradigm and evaluation compatibility warnings that print during a benchmark run.

Feel free to adjust or reject this.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b9d01a0bba9e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.