# Issue

**Title:** MRG: refactor of time slice routines

## Description

I hadn't really thought through selecting the slice axis for time-slice
routine utilties or for the diagnostic screening utilities.

Refactor the nipy_tsdiffana and nipy_diagnose command line utilties to
use a common interface for selecting slice and time axes.  Put command
logic in a `commands` module and test more.  Generalize diagnostic
screening utilities to any time axis rather than assuming time is the
last axis (the pca module explicitly allows this).  Deprecate guess at
slice axis for screening function (but continue to guess for Nifti-like
images from the command line).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5419911e9954`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.