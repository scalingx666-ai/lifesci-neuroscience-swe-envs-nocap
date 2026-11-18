# Issue

**Title:** Update branch references from master to main

## Description

The repository default branch has been renamed from `master` to `main`. This PR updates the remaining hard-coded branch references so links resolve against the new default branch:

- **README.md** — codecov coverage badge (`branch/master` → `branch/main`)
- **.github/workflows/greetings.yml** — Contributing Guide link (`blob/master` → `blob/main`)
- **docs/brainpy-changelog.md** — permalink to `test_STDP.py` (`blob/master` → `blob/main`)

Domain-code occurrences of `master` (e.g. `master_type`, `register_master` in ion channels / synapses) and the external `sphinx-doc.org/en/master` URL are intentionally left unchanged. CI workflows already trigger on `branches: ['**']`, so no workflow trigger changes are needed.

## Summary by Sourcery

Update hard-coded GitHub and Codecov branch references from `master` to `main` to reflect the repository’s default branch rename.

Bug Fixes:
- Ensure README Codecov coverage badge targets the `main` branch so coverage links remain valid.
- Fix GitHub greetings workflow Contributing Guide link to point to the `main` branch.
- Correct changelog permalink to the STDP test file to reference the `main` branch path.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6abc7adccc68`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.