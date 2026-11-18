# Issue

**Title:** fix(docs): update Read the Docs configuration for symbolic link handling

## Description

## Summary by Sourcery

Standardize Read the Docs builds by using a symlinked docs_build directory to handle multiple documentation versions

Enhancements:
- Add post_checkout job in .readthedocs.yml to symlink version-specific docs into a unified docs_build directory
- Point Sphinx configuration to docs_build/conf.py instead of a static docs path
- Remove the now-obsolete docs_version2/.readthedocs.yml file

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5d94e25d5f53`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.