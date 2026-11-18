# Issue

**Title:** radcor

## Description

- add -do_detrend to @radial_correlate
- default to no only for errts
- in afni_proc.py, do not pass all_runs to radcor

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d340c8bcffd7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.