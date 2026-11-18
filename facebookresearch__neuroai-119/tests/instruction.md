# Issue

**Title:** fix: align study filenames with class names

## Description

## What does this PR do?

Fixes naming inconsistencies where study filenames didn't match their class names. Canonical filenames that match the class definitions in `neuralfetch` are now used consistently:

- Renamed `neuralfetch/studies/schalk2004bci.py` → `schalk2004bci2000.py`
- Renamed `neuralfetch/studies/zyma2019eeg.py` → `zyma2019electroencephalograms.py`
- Renamed `neuralbench/tasks/eeg/motor_imagery/datasets/schalk2004bci.yaml` → `schalk2004bci2000.yaml`
- Updated the `pytest.mark.parametrize` dataset name and docstring in `neuralbench/test_cli.py`
- Fixed a stale filename reference in a comment in `neuralfetch/studies/moabb2025.py`

## Related Issues

<!-- e.g. ,  -->

## Checklist

- [x] Tests added or updated
- [x] `pytest` and `mypy` pass locally

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `997b0c1b609c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.