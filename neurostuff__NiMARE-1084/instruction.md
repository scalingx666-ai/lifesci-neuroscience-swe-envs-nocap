# Issue

**Title:** Document the label_threshold parameter in get_studies_by_label

## Description

The `label_threshold` parameter of `Dataset.get_studies_by_label` was documented only as "Default is 0.5.", which is both wrong (the default is `0.001`) and unexplained.

This rewrites the entry to state the correct default and explain the threshold: a study is included when its annotation value for every requested label is `>= label_threshold`, and for Neurosynth-style annotations those values are tf-idf weights (higher = the term is more important to that study's text relative to the corpus), so the threshold is only interpretable within the corpus the annotations were derived from. (Per the discussion in the issue.)

Docstring-only; no behavior change. `flake8 nimare/dataset.py` passes.

## Summary by Sourcery

Documentation:
- Expand the documentation of Dataset.get_studies_by_label.label_threshold to describe its inclusion criteria, tf-idf semantics for Neurosynth-style annotations, and correct the documented default value to 0.001.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ba8d9214e263`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.