# Issue

**Title:** [SCHEMA] Warn when *_beh.tsv contains onset and duration

## Description

## Summary

Add a schema warning when a `*_beh.tsv` file contains both `onset` and `duration`. A file containing only one of these columns does not trigger the warning.

The check uses direct column access because `columns` is exposed as a mapping in the current validator, so `intersects(columns, ...)` does not inspect the column names.



## Checks

- `yamllint` passes
- full `bidsschematools` test suite: 81 passed, 1 skipped
- checked with the current Deno validator against five small cases: both columns, onset only, duration only, neither, and a valid `events.tsv`
- checked two existing BIDS example datasets for false positives

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4235ae7a2a52`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.