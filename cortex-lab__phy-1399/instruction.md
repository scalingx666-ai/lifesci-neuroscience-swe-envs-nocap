# Issue

**Title:** Restore per-cluster view spike budgets

## Description

## Summary

- make Waveform, Amplitude, and Correlogram sampling fixed per cluster by default while retaining optional shared total caps
- prevent dataset-local view state, including the Firing Rate time range, from leaking through global GUI state
- clarify budget semantics, Firing Rate behavior, configuration examples, and troubleshooting documentation

## Why

A shared total budget makes per-cluster sampling accuracy decrease as more clusters are selected. Both policies are useful, so the per-cluster ceilings remain primary and an integer `*_total` value opts into a shared cap. Separately, a stale globally persisted Firing Rate `x_max` could clip spikes in fresh datasets.

## Validation

- `make lint`
- `make format-check`
- `make doc-check`
- core/GUI phase of `make test-full`: 363 passed, 1 skipped
- application suite against phylib master `db10401589b47fd8d56f7c66531b0c22fc7f9e91`: 133 passed
- focused GUI state and histogram regressions: 8 passed

The locked PyPI phylib 2.7.0 predates the existing `spikes_are_disjoint` selector argument already used on `master`; current phylib source is required for the application suite.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e2fff4a12e03`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.