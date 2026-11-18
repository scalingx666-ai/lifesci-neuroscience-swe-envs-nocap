# Issue

**Title:** feat(data-classes): add extra_data dict to layer logs and input_metadata to ModelLog

## Description

## Summary
- Add `LayerLog.extra_data: Dict[str, Any]` for user-managed layer annotations.
- Add `LayerPassLog.extra_data: Dict[str, Any]` for user-managed per-pass annotations.
- Add `ModelLog.input_metadata: Dict[str, Any]` for user-managed input stimulus metadata.

No automatic population this sprint -- users mutate the dicts after the forward pass.

No visualization integration -- deferred to a later sprint.

FIELD_ORDER placement: the new fields sit next to `activation_postfunc`/saved-tensor config because they are user-facing annotation metadata on the same log surfaces.

## Tests
- `ruff format .`
- `ruff check . --fix`
- `mypy torchlens/`
- `pytest tests/ -m smoke -x --tb=short`
- `pytest tests/test_extra_data_plumbing.py -v`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a32c6c031abc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.