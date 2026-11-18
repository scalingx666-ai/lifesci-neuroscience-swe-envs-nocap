# Issue

**Title:** Update coverage call, don't install in editable mode in testing

## Description

## Motivation

Follow-up to 

https://setuptools.pypa.io/en/latest/userguide/development_mode.html says
> Editable installs are not a perfect replacement for regular installs in a test environment. When in doubt, please test your projects as installed via a regular wheel. There are tools in the Python ecosystem, like [tox](https://pypi.org/project/tox) or [nox](https://pypi.org/project/nox), that can help you with that (when used with appropriate configuration).

We use editable installs in testing in a couple places, mostly to help `coverage` find the sources, but we can configure that in `pyproject.toml` instead.

## How to test the behavior?
Run GitHub actions

## Checklist

- [x] Did you update CHANGELOG.md with your changes?
- [x] Have you checked our [Contributing](https://github.com/NeurodataWithoutBorders/pynwb/blob/dev/docs/CONTRIBUTING.rst) document?
- [x] Have you ensured the PR clearly describes the problem and the solution?
- [x] Is your contribution compliant with our coding style? This can be checked running `flake8` from the source directory.
- [x] Have you checked to ensure that there aren't other open [Pull Requests](https://github.com/NeurodataWithoutBorders/pynwb/pulls) for the same change?
- [x] Have you included the relevant issue number using "Fix #XXX" notation where XXX is the issue number? By including "Fix #XXX" you allow GitHub to close issue #XXX when the PR is merged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `376e6abaf48b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.