# Issue

**Title:** [MAR-2518] Make gather reads snapshot consistent

## Description

## Human summary

Gathered cache results now come from one SQLite snapshot, so batched record and search lookups cannot mix old and new cache generations.

## Summary

- Wrap `gatherRecords()` item reads in one explicit SQLite read transaction after any requested hydration completes.
- Prepare the gather show statement once per call and reuse one compact search statement shape for repeated queries.
- Share compact row mapping with standalone compact search and avoid selecting unused full record JSON for compact results.
- Add regression coverage for cache mutation between gather items, duplicate ID/query ordering, and statement reuse.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `96331769caf5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.