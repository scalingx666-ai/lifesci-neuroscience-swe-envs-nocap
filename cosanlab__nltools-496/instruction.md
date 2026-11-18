# Issue

**Title:** fix(predict): integer cv is always stratified — group-aware with groups, quantile-binned for continuous targets

## Description

## Summary

Two related changes to how `BrainData.predict(cv=<int>, ...)` resolves its splitter.

**1. `groups` was silently ignored.** An integer `cv` built `StratifiedKFold` (classifiers) or `KFold` (regressors) and forwarded `groups` to `split()`, which those splitters ignore — sklearn warns *"The groups parameter is ignored by StratifiedKFold"* once per split. A subject could sit on both sides of a fold while the caller believed the folds were group-aware. dartbrains' Spatial Feature Selection chapter hit this on whole-brain, ROI and searchlight decoding (16k copies of the warning on the built page, leaked folds behind numbers the prose interprets). With `groups` given, an integer `cv` now resolves to the group-aware `StratifiedGroupKFold`.

**2. Continuous targets are stratified too.** Regressors used plain `KFold`, so on a skewed or ordered target the folds' outcome distributions (and means) could differ by chance. An integer `cv` now always means a *stratified* K-fold: for regressors the folds are balanced on quantile bins of `y` (`continuous_strata` caps the bin count so every bin can feed every fold — ≥ 2·n_splits members, at most 10 bins — and passes ordinal targets through as their own labels). `make_stratified_cv()` is the single resolver; `_ContinuousStratifiedSplitter` exposes the sklearn `split`/`get_n_splits` protocol so whole-brain, ROI and searchlight paths work unchanged. Everything shuffles with `random_state`.

Explicit splitters passed as `cv` are untouched. Docstrings for `cv`/`groups` updated.

## Test plan

- [x] full `pytest nltools/tests` passes
- [x] `TestGroupsWithIntegerCV`: with `UserWarning` escalated to an error, classifier and regressor paths run clean with `groups`; no-groups path unchanged
- [x] `TestContinuousStratification`: quantile bins have ≥ 2·n_splits members and ordinal targets pass through; on a sorted exponential target the spread of fold means is < 1/5 of plain `KFold`'s and their average matches the sample mean; grouped continuous folds never split a group
- [x] `ruff check` / `ruff format`

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_012xzEFw9vZWtExYbF6okmxG

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aefacfd8be84`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.