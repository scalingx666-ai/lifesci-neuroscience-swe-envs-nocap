# Issue

**Title:** Del unused funcs

## Description

## Motivation

Move breaking changes from #2031 to this new branch/PR so they can be reviewed and merged separately. 

Removed unused functions `prepend_string` and `_not_parent` in `core.py`, `_not_parent` in `file.py`, and `NWBBaseTypeMapper.get_nwb_file` in `io/core.py`

## Checklist

- [X] Did you update CHANGELOG.md with your changes?
- [X] Have you checked our [Contributing](https://github.com/NeurodataWithoutBorders/pynwb/blob/dev/docs/CONTRIBUTING.rst) document?
- [X] Have you ensured the PR clearly describes the problem and the solution?
- [X] Is your contribution compliant with our coding style? This can be checked running `ruff check . && codespell` from the source directory.
- [X] Have you checked to ensure that there aren't other open [Pull Requests](https://github.com/NeurodataWithoutBorders/pynwb/pulls) for the same change?
- [X] Have you included the relevant issue number using "Fix #XXX" notation where XXX is the issue number? By including "Fix #XXX" you allow GitHub to close issue #XXX when the PR is merged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1b613aa0b1c4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.