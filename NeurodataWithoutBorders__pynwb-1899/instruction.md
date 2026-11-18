# Issue

**Title:** Update run_all_tests.yml for ros3 using macos-13

## Description

## Motivation

What was the reasoning behind this change? Please explain the changes briefly.
The ros3 tests/gallery tests use DANDI, which does not support osx-arm64 (this is used in macos-latest). As a result, we need to use macos-13 until this changes.

## How to test the behavior?
```
Show how to reproduce the new behavior (can be a bug fix or a new feature)
```

## Checklist

- [x] Did you update CHANGELOG.md with your changes?
- [x] Have you checked our [Contributing](https://github.com/NeurodataWithoutBorders/pynwb/blob/dev/docs/CONTRIBUTING.rst) document?
- [x] Have you ensured the PR clearly describes the problem and the solution?
- [x] Is your contribution compliant with our coding style? This can be checked running `flake8` from the source directory.
- [x] Have you checked to ensure that there aren't other open [Pull Requests](https://github.com/NeurodataWithoutBorders/pynwb/pulls) for the same change?
- [x] Have you included the relevant issue number using "Fix #XXX" notation where XXX is the issue number? By including "Fix #XXX" you allow GitHub to close issue #XXX when the PR is merged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `73d6dfa92921`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.