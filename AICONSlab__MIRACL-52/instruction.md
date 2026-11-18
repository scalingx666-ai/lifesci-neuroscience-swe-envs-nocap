# Issue

**Title:** Sta workflow

## Description

- changed entrypoint for docker image
- updated link to example data, third party software used by MIRACL (c3d, ANTs)
- fixed bug where `extract_lbl` was not generating a mask of the region of interest

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9d40fee47033`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.