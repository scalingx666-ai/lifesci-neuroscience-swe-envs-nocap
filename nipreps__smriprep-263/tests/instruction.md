# Issue

**Title:** FIX: Revert to FAST

## Description

.

Open question: This changes the workflow graph, but only by changing the branch that is followed. Is this acceptable to put in 0.7.x for use in fMRIPrep 20.2.x (ref [Versions Matrix](https://www.nipreps.org/devs/versions/#fmriprep))?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d1604550f251`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.