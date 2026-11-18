# Issue

**Title:** MAINT: Fix imports and clean up project configuration

## Description

- Remove dead sys.path.insert in docs/conf.py (ran after import antropy, so had no effect)                                                                 
- Remove incorrect py-modules = ["antropy"] from pyproject.toml (for single-file modules only; package discovery via packages.find was already correct)
- Add explicit testpaths and pythonpath = ["tests"] to pytest config, replacing the implicit sys.path injection that made from utils import work in test   
files                                                     
- Bump minimum pytest to 7.0 (required for pythonpath ini option)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `af7b2d1b46e0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.