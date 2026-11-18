# Issue

**Title:** Fix saved model path collisions across paradigms

## Description

## Summary

 by namespacing saved evaluation artifacts with the paradigm and optional run suffix. Two benchmark runs that share an evaluation type, dataset, subject, session, and pipeline no longer overwrite one another when their paradigm or suffix differs.

The layout is now:

`<Models|GridSearch>_<evaluation>/<Paradigm>/<suffix-if-set>/<dataset>/<subject>/<session>/<pipeline>/`

The model path change is documented as an API compatibility change. Calls to the private path helper that omit `paradigm` retain their previous layout.

## Validation

- `git diff --check`
- `python -m py_compile moabb/evaluations/base.py moabb/evaluations/utils.py moabb/tests/test_evaluations.py`
- `uv run --active --no-sync python -m pytest moabb/tests/test_evaluations.py -q -k 'create_save_path or test_within_session_evaluation_save_model'` — 11 passed.
- Added path tests covering paradigm and suffix isolation, plus an integration test that runs a fake EEG evaluation and checks the paradigm-scoped output directory.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `64fa04e01d9f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.