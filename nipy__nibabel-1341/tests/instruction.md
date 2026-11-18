# Issue

**Title:** RF: Replace OneTimeProperty/auto_attr with cached_property

## Description

The type annotations of `nibabel.onetime.OneTimeProperty` have stopped checking with recent mypy. Given that this is redundant with `functools.cached_property`, it seems cleaner just to replace these synonyms directly with `cached_property`.

Also grabbed a test from nitime to verify that partial resets succeed.

Small fix for building docs with 3.12 *en passant*.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `beb4f7bf32a2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.