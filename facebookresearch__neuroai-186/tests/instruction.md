# Issue

**Title:** Align study/file names

## Description

## Summary

Add `ensure_study_symlink` helper in `neuralfetch.download` for studies that share a physical data directory under different class names (e.g. subclass variants pointing at the parent's folder). Creates a relative symlink so the link stays valid if the studies root is moved.

## What does this PR do?

<!-- Brief description of the change. -->

## Related Issues

<!-- e.g. ,  -->

## Checklist

- [ ] Tests added or updated
- [ ] Docstrings updated for any changed public APIs
- [ ] `pytest` and `mypy` pass locally

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `00e0510ad89c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.