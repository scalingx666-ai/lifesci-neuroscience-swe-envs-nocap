# Issue

**Title:** Use the caller's dataset instances from include_datasets in benchmark

## Description

## Problem
`benchmark(include_datasets=[...])` accepts dataset objects, matches them against the paradigm's datasets by code, and then evaluates the paradigm's **freshly constructed default instances**. Any constructor argument the caller set is silently dropped. For example:

- `include_datasets=[Shin2017A(accept=True)]` still fails with "You must accept licence term to download this dataset, set accept=True";
- a subject-restricted instance still runs every subject.

## Change
In `_inc_exc_datasets`, when `include_datasets` contains dataset objects, the caller's instances are returned (matched by code) instead of the defaults. Codes as strings behave exactly as before. `FakeDataset` keeps its existing dedicated handling in `benchmark`.

## Tests
`test_include_datasets_keeps_user_instances`: a customised `BNCI2014_001` instance passed in `include_datasets` is returned as the same object with its customisation, while a string code still returns the default instance.

## Verification (Voyager, isolated serial runs)
- `ruff check` + `ruff format --check` on the changed files: clean.
- New test(s): **fail on unmodified `develop`**, pass on this branch.
- Full test file of the touched module on this branch, compared with a `develop` baseline run in the same environment: no new failures.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6584158d771b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.