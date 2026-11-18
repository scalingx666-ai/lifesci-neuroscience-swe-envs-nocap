# Issue

**Title:** DOCKER: Bundle FreeSurfer 7.2

## Description

Squashed version of nipreps/fmriprep#2779. Want to make sure this doesn't break anything.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `af81b8311434`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.