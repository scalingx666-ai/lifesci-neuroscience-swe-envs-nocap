# Issue

**Title:** Fix Read the Docs dependency setup

## Description

## Summary

- remove the stale `requirements.txt` installation from the Read the Docs configuration
- rely on the native MkDocs environment prepared by Read the Docs

## Root cause

The root `requirements.txt` was removed during the uv migration, but `.readthedocs.yaml` still instructed Read the Docs to install it. Build 33633688 therefore stopped before the MkDocs build.

## Impact

The `latest` documentation can build from `master` again and publish the final phy 2.1.0 release notes.

## Validation

- parsed `.readthedocs.yaml` and verified the MkDocs configuration
- `uv run mkdocs build --strict`
- `git diff --check`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e62f5685c00a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.