# Issue

**Title:** Fix display of multi-valued cluster metadata

## Description

## Summary

- Display list-, tuple-, and NumPy-array-valued metadata as comma-separated text in native cluster tables.
- Preserve native NumPy scalar conversion.
- Add a focused ClusterView regression test and changelog entry.

## Root cause

The Qt table model returned collection values directly for Qt DisplayRole. Qt renders those unsupported values as empty cells, unlike the previous web table.

## Validation

- 46 native table and focused ClusterView tests passed.
- make lint
- make format-check
- Documentation link check and strict MkDocs build

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `09c8d1d583a7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.