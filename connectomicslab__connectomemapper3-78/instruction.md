# Issue

**Title:** ENH: Review installation to be compatible with PyPI

## Description

This PR includes the following:

- REF: Review the `setup.py` and `setup_gui.py` scripts to be compatible with `pip install ...`
- REF: Rename `setup.py` to `setup_cmp.py` 
- REF: Rename `setup_gui.py` to `setup.py` as `pip` is able to process only `setup.py` files
- ENH: Creation of the new `cmp.cli` module
- MAINT: Migration of scripts `connectomemapper3`, `showmatrix_gpickle`, and `cmpbidsappmanager` to `cmp.cli` module
- REF: Refactoring of scripts with correction of code style issues and the addition of missing docstrings
- CI: Add `test-python-install` job in CircleCI to test installing and building the distribution wheel.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a891c4fa41f4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.