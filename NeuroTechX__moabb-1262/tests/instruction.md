# Issue

**Title:** ENH use a metadata-aware cv_class directly as the top-level splitter

## Description

### ENH use a metadata-aware cv_class directly as the top-level splitter (#1104)

A cv_class that declares metadata_columns and implements
split(self, y, metadata) is no longer wrapped as the inner groups-CV:

- CrossSubjectEvaluation builds it with cv_kwargs and routes it through
  the existing top-level splitter path (fold validation, split metadata,
  train/calibration/test support).
- CrossSubjectSplitter and CrossSessionSplitter call its split(y, metadata)
  and get_n_splits(metadata) directly.

The splitter owns the whole fold, so rows can be left out of both train
and test (e.g. test one target subject on one session and drop its other
sessions). Ordinary scikit-learn CVs, and LearningCurveSplitter (which has
metadata_columns but split(X, y, groups)), keep the inner-CV path.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2dddfe7803c5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.