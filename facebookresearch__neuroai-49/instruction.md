# Issue

**Title:** Propagate bids fields to new events from transforms

## Description

## What does this PR do?

transforms add events to the dataframes and those events can lack the bids field, this propagates it when needed

[full] = no missing bids
[half] = half missing fields for each timeline


shape | main | branch | ratio
-- | -- | -- | --
1k tl × 100 = 100k [full] | 11 ms | 12 ms | 1.15×
1k tl × 100 = 100k [half] | 11 ms | 43 ms | 4.06×
100k tl × 100 = 10M [full] | 1 969 ms | 2 034 ms | 1.03×
100k tl × 100 = 10M [half] | 1 790 ms | 5 110 ms | 2.85×

## Checklist

- [x] Tests added or updated
- [x] Docstrings updated for any changed public APIs
- [x] `pytest` and `mypy` pass locally

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cca521661e20`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.