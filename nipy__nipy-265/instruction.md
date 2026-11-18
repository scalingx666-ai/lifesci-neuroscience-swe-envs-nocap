# Issue

**Title:** ENH: A script which serves as a wrapper to FmriRealign4d

## Description

This is a little script to do argument parsing, file-handling, figure generation, around the 4D motion correction/realignment functionality. Emulates the input/output of FSL's mcflirt and also generates a figure with the parameters.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1afc552a0535`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.