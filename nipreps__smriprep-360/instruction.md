# Issue

**Title:** RF: Break up surface workflows for easier mix-and-match in fMRIPrep

## Description

Should have no effect on current outputs, but:

1) Moves midthickness check/creation back into `surface_recon_wf`, which then needs a sync function to ensure that downstream nodes don't try to extract surfaces before midthickness is present.
2) Split surface and morphometric translation to GIFTI into their own workflows, as these are independent.
3) Pass the selected surfaces and morphometry files as arguments.

Does not need immediate merge. Will probably do more.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `311328c12022`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.