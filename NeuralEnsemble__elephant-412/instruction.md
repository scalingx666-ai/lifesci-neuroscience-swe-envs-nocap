# Issue

**Title:** [Enhancement] Set complexity dtypes for memory efficiency

## Description

Hey!

@Kleinjohann and I have made minor changes to the Complexity class to use `np.uint16` type values in the complexity arrays, this should be able to represent complexities all the way to 65,535 which not even the largest recording systems can achieve right now. 

We also updated the tests to check that this dtype is kept all the way to the single spike train annotations, reducing the memory usage by a factor of 4. 

Let us know if we should change somethings

Best,
Aitor&Alex

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `165276fe2617`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.