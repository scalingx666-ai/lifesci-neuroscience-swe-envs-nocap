# Issue

**Title:** MRG: Extend testing, fix / simplify interpolation

## Description

Extend testing of prefiltered interpolation.

This revealed various bugs:

* Prefiltering=False of linear interpolation was failing, because the
  prefilter=False option didn't make sense - because we were (correctly)
  not prefiltering.
* Use more standard TemporaryFile for backing store to avoid errors from
  too many open files.
* Avoid padding before prefiltering for Scipy < 1.6, because this gives
  different results from non-prefiltered case.

Also

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3c0622901dae`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.