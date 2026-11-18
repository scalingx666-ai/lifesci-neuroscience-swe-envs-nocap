# Issue

**Title:** Add GitHub Actions

## Description

Fixes issue #499.

Also made a number of other changes in the process of getting GitHub
Actions to run. I think it makes sense to include them here as opposed
to making separate PRs for them.

Add workaround for editable user install.

Ignore flake8-docstrings errors (not part of CONTRIBUTING).

Use flake8 extend-ignore instead of explicit ignore.

Add IGNORE_CONDA env variable for pr-check to use Venv even when Conda
is available.

Drop unused Jenkins script.

Remove editable install from requirements-dev.txt to speed up testing.

Fix missing matnormal in pr-check.

Disable tests with mpiexec with non-fork multiprocessing (issue #501).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0954cf3aa67c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.