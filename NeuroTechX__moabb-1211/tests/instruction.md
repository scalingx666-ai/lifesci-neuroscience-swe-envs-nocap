# Issue

**Title:** FIX keep CrossSubject results subject-specific for grouped folds

## Description

## Summary

`CrossSubjectEvaluation` supports grouped cross-validation strategies where a single test fold can contain more than one subject (for example `GroupKFold(n_splits < n_subjects)`). The flattened evaluation engine currently assigns the entire fold to `test_meta["subject"].iloc[0]` and then only splits scores by session.

That silently mixes different held-out subjects that share a session label and stores the results under whichever subject appears first.

## Context in the evaluation-safety series

This is the CrossSubject  and #1210. #1207 enables explicit grouped splitters; #1210 preserves session identity for multi-session folds; this PR completes the same **result-provenance invariant** across subjects so grouped CrossSubject folds cannot silently attribute several held-out subjects to the first one.

## Fix

Keep one fit per CV fold, but score and store the fitted model separately for every held-out subject/session that still needs this pipeline.

- add an opt-in per-subject score grouping contract to the shared evaluation engine;
- enable it only for `CrossSubjectEvaluation`;
- preserve partial-cache work plans so already-computed subjects are not recomputed;
- when `save_model=True`, store the one fitted fold model under every held-out subject that owns a result;
- default leave-one-subject-out behavior is unchanged.

## Regression coverage

A focused test uses four subjects, two sessions, and `n_splits=2`, so every `GroupKFold` test fold holds out two subjects simultaneously. It verifies:

- all four subjects remain present in the results;
- each subject/session pair appears exactly once;
- all eight expected result rows are emitted;
- `n_samples_test` matches the true trial count of each subject/session pair.

This is the CrossSubject analogue of the same provenance invariant addressed for multi-session CrossSession folds in #1210.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d7e0951120b4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.