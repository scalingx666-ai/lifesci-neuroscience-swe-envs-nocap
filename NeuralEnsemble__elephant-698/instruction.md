# Issue

**Title:** Added CI for latest upstream dependencies

## Description

# Desc
Adds a weekly workflow that tests elephant against the master/pre-release builds of its dependencies, so upstream breaking changes are caught early.
  
# Code
  - Compiled deps (numpy, scipy, scikit-learn, statsmodels) use latest stable from PyPI
  - Pure-Python deps (neo, quantities, tqdm, jinja, pytest) installed from git default branch
  - Elephant itself installed with `--no-deps` to prevent pip from downgrading canary versions
  - Triggers weekly (Monday 06:00 UTC) and on manual dispatch

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a335a80e8d17`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.