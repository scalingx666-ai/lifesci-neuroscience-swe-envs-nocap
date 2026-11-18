# Issue

**Title:** Minor project updates

## Description

## Motivation

Minor updates to fix build errors in the run all tests GH action and to apply the upper bound to hdmf that was discussed in 

These changes are intended to be merged into the release-3.0.0 branch.

## Checklist

- [x] Did you update CHANGELOG.md with your changes?
- [X] Have you checked our [Contributing](https://github.com/NeurodataWithoutBorders/pynwb/blob/dev/docs/CONTRIBUTING.rst) document?
- [X] Have you ensured the PR clearly describes the problem and the solution?
- [X] Is your contribution compliant with our coding style? This can be checked running `ruff check . && codespell` from the source directory.
- [X] Have you checked to ensure that there aren't other open [Pull Requests](https://github.com/NeurodataWithoutBorders/pynwb/pulls) for the same change?
- [X] Have you included the relevant issue number using "Fix #XXX" notation where XXX is the issue number? By including "Fix #XXX" you allow GitHub to close issue #XXX when the PR is merged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9d7bad1c167b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.