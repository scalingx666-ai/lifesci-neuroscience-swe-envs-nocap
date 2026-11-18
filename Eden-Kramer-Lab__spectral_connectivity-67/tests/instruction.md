# Issue

**Title:** Branch 8: Build & Packaging Migration to pyproject.toml

## Description

## Summary
- Complete migration from legacy setup.py to modern pyproject.toml using PEP 621 standards
- Remove setup.py completely and consolidate all package metadata in pyproject.toml
- Update dependency versions to modern minimums (Python >=3.9, numpy>=1.21, etc.)
- Add proper dev and gpu extras configuration with updated package versions
- Fix deprecated license format and add comprehensive project metadata
- Maintain backward compatibility while modernizing build infrastructure

## Test plan
- [x] Verify wheel builds successfully with `python -m build`
- [x] Test editable install with `pip install -e .`
- [x] Confirm import functionality after installation
- [x] Run full test suite - passes with same 3 pre-existing failures
- [x] Validate package metadata and dependency resolution

🤖 Generated with [Claude Code](https://claude.ai/code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3f78dbd6b5c2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.