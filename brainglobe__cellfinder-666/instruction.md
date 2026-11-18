# Issue

**Title:** Update supported Python versions to 3.12-3.14

## Description

Update the supported Python versions to 3.12-3.14, following [SPEC 0](https://scientific-python.org/specs/spec-0000/).

- Bump `requires-python` to `>=3.12`
- Update the Python version classifiers and tool target versions
- Update the CI test matrix to Python 3.12-3.14 (other OSes on `3.14`)

Tracked in

This PR was opened by a script. Please check that CI passes on the new Python versions before merging.

**Please review:** these lines still mention a dropped Python version and were not changed automatically:
```
.github/workflows/test_and_deploy.yml:151:          key: ${{ runner.os }}-3.10-${{ hashFiles('**/pooch_registry.txt') }}
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5afa7846704b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.