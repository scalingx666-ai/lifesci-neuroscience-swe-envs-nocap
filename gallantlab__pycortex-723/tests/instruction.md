# Issue

**Title:** Document basic.cache config option

## Description

## Summary

The `basic.cache` setting used in `Database.get_cache` (`cortex/database.py`) was previously undocumented outside of the implementation itself.

- Added a commented-out `cache` entry under `[basic]` in `cortex/defaults.cfg` explaining its purpose and default behavior.
- Documented the option in `docs/install.rst` alongside the existing `filestore` docs.
- Added a docstring to `Database.get_cache`.



Generated with [Claude Code](https://claude.ai/code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1b02f9c22946`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.