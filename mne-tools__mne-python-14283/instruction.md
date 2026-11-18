# Issue

**Title:** MRG: Avoid pytest 10 warnings in sklearn estimator checks

## Description

#### Reference issue

.

#### What does this implement/fix?

MNE's decoding estimator-compliance tests currently receive a generator-backed iterable from scikit-learn's `parametrize_with_checks`. Pytest 10 deprecates passing non-collection iterables to `parametrize`, which produces warnings and can become an error.

This change adds a local compatibility wrapper in `mne.decoding.tests` that materializes only the parametrized estimator values while preserving the surrounding pytest marks and their arguments. The affected decoding test modules use this wrapper, and the old warning suppression in `mne/conftest.py` is removed.

#### Additional information

Validation completed locally:

- 1,333 affected tests collected.
- 1,215 selected sklearn-compliance tests passed; 5 skipped.
- Ruff lint and format passed.
- Ty passed.
- Codespell passed.
- `git diff --check` and AST parsing passed.

This branch also includes the required Towncrier fragment and new-contributor entry.

AI assistance disclosure: Codex was used to inspect the repository and issue, plan the compatibility change, assist with implementation, and review the resulting diff. The submitted patch is accompanied by the local validation listed above; the author should review and understand every changed line.

Related commit: `81d4b379`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `277fd531bb1e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.