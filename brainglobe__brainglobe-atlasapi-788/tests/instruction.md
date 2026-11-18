# Issue

**Title:** Fix inconsistent atlas version punctuation in listing metadata

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

`get_atlases_lastversions()` currently returns inconsistent version formatting in its metadata:

- `version` may be returned as folder-style (e.g. `3_0`)
- `latest_version` is returned in dotted form (e.g. `3.0`)

This makes the output inconsistent and can affect downstream display logic.

**What does this PR do?**

This PR normalises local atlas version metadata to dotted form so that `version` and `latest_version` use the same format.

It also:

- adds a small helper to convert folder-style versions to dotted form
- updates tests to cover the conversion and returned metadata
- updates the relevant docstring to reflect the behaviour
- keeps existing placeholder/missing-version display logic intact, while safely handling `None` versions in table rendering

## References



## How has this PR been tested?

Tested locally by running:

- `pytest tests/atlasapi/test_list_atlases.py -v`
- `ruff check brainglobe_atlasapi/list_atlases.py tests/atlasapi/test_list_atlases.py`
- `pre-commit run --files brainglobe_atlasapi/list_atlases.py tests/atlasapi/test_list_atlases.py`

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

No external documentation update is required.  
A small inline docstring update was added to clarify that returned version metadata is normalised to dotted form.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7fd58012a268`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.