# Issue

**Title:** docs(segment): added **kwargs in docstrings

## Description

init_subject's **kwargs (forwarded to freesurfer.autorecon, plus the deprecated run_all alias) and cut_surface's **kwargs (forwarded to freesurfer.flatten or flatten_slim depending on flatten_with) were both undocumented. Adds indented **kwargs entries listing each forwarded argument individually.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `505a0478ba44`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.