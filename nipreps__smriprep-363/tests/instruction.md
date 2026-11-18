# Issue

**Title:** RF: Replace most of anat_ribbon_wf with a Python function

## Description

Got sidetracked and rewrote all of `anat_ribbon_wf` except the creating signed distance volumes in Python. Wrote unit and integration test to verify that we do get the same results before replacing.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `244f1b2eff63`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.