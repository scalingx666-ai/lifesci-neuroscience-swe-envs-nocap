# Issue

**Title:** Dev

## Description

Updates from amplitude exploration:

Changes:
- New kwargs for increased user control or fitting, in terms of amp & # oscs.
- Fix an error in which it would fail if no oscs guesses were found
- No longer drop negative values in flat PSD (I think this was leftover in error)
- Small clean ups on variables names. 

Things tried (didn't make it in):
- Compare to single, initial st. dev, instead of iterative (no dice)
- Try a more explicit 'outlier detection', using IQR (no better)

Note:
- Although some of the above helps tune, no fundamental change / fix for amplitude detection, other than allowing for user tuning. 
- I tried thinking of an approach more based on the distribution of the residuals, but not sure exactly how to proceed with that.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `65de48dc65a1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.