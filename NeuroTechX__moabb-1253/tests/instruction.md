# Issue

**Title:** Stratify LearningCurveSplitter ratio subsets

## Description

## Problem
With `policy="ratio"`, `LearningCurveSplitter._get_data_size_subsets` takes an unstratified prefix (`range(n)`) of the shuffled training pool. Small subsets therefore often miss classes:
- on the ungrouped path, splits are skipped with "training set has only one class";
- with more than two classes, the training set can contain a class subset. Fitting then crashes when a test fold has a class absent from training (`y contains previously unseen labels: 'rest'` for 4-class motor imagery, `'13'` for a 12-class SSVEP dataset in our runs).

## Change
Ratio subsets are now prefixes of a class-interleaved ordering of the same shuffled pool. Each sample gets the key `rank_within_class / class_size`, followed by a stable sort, so:
- sizes stay exactly `ceil(ratio * n)` (the existing size assertions hold);
- subsets stay nested across sizes, since all are prefixes of one ordering;
- order within a class is the input order, so each permutation is still randomised;
- one sample of every class comes first, and classes are then interleaved proportionally.

The `per_class` policy is untouched.

## Tests
- `test_learning_curve_ratio_subsets_are_stratified`: with 90/10 labels and the minority deliberately last in the pool, every subset holds both classes in proportion (±1); sizes and nesting are checked.
- `test_learning_curve_ratio_split_never_yields_single_class_train`: a 45/5 pool yields all 8 splits with both classes and no skip warning (warnings turned into errors).

## Verification (Voyager, isolated serial runs)
- `ruff check` + `ruff format --check` on the changed files: clean.
- New test(s): **fail on unmodified `develop`**, pass on this branch.
- Full test file of the touched module on this branch, compared with a `develop` baseline run in the same environment: no new failures.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d272c8cea917`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.