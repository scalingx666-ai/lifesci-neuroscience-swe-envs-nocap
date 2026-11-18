# Issue

**Title:** Fix OpenNeuro NEMAR identifiers

## Description

.

Use the existing NEMAR OpenNeuro rehosts instead of the obsolete placeholder deposits:
- TrianaGuzman2024: `on005342`
- Chailloux2020: `on003190`

Both datasets are removed from the pending-deposit registry so the standard NEMAR ID validation now exercises them.

Tests:
- `pytest moabb/tests/test_datasets.py -k all_datasets_have_valid_nemar_id`
- `ruff check moabb/datasets/triana_guzman2024.py moabb/datasets/chailloux2020.py moabb/tests/test_datasets.py`
- `ruff format --check moabb/datasets/triana_guzman2024.py moabb/datasets/chailloux2020.py moabb/tests/test_datasets.py`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ea431132f07e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.