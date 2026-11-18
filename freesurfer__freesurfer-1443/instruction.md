# Issue

**Title:** Error in nibabel encountered when loading large volumes

## Description

spefically in get_fdata method associated with the object returned from nibabel.load(). Added try/except block to catch and advise user on workaround while proper fix is implemented.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1e4efffb170c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.