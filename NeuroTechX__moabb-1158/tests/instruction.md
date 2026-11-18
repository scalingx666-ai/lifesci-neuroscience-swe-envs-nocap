# Issue

**Title:** Randomise the LearningCurveSplitter subsample when groups are passed

## Description

Closes: 

---

`_get_data_size_subsets` takes a prefix of the training indices, which is a random draw only because StratifiedShuffleSplit shuffles them. GroupShuffleSplit returns them ascending, so on the grouped branch the subsample was the earliest samples in recording order -- identical across permutations, and taken from whichever group sorted first. That covers every learning curve run through CrossSessionEvaluation or CrossSubjectEvaluation, where `n_perms` measured no variance and the small-data_size end of a curve was biased low.

Only the grouped branch is shuffled, so the ungrouped one keeps its results. `base_splits` is drained first because a parent splitter may pass a shared RandomState, which would otherwise move the test folds.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `030a66c041ed`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.