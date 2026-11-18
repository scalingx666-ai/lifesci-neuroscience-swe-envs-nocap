# Issue

**Title:** [MAR-2534] Use locale-independent canonical ordering

## Description

## Human summary

Canonical ordering no longer depends on process locale, so generated records and cache fingerprints remain stable across platforms.

## Summary

- Add one documented UTF-16 ordinal string comparator that preserves ASCII ordering without normalising stored strings.
- Replace `localeCompare()` in baseline generation, canonical payload key sorting, record scans, cache manifests, and init conflict/supersession ID ordering.
- Update existing tests to use the shared comparator where they assert ordered keys or generated subjects.
- Add locale-spawned determinism coverage for accented/decomposed strings, Turkish dotted/dotless characters, emoji, numeric-looking names, mixed ASCII case, baseline payloads, cache manifests, canonical payloads, and list/search tie-break ordering.
- Document the ordering contract in the implementation plan.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a2c248ed8bd6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.