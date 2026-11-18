# Issue

**Title:** bump upload-artifact version

## Description

## Motivation

The pre-release deployment step of the `run_tests.yml` workflow was failing because the artifact could not be found. I think upload-artifact and download-artifact need to be the same major version to be [compatible](https://github.com/actions/toolkit/blob/main/packages/artifact/docs/faq.md#which-versions-of-the-artifacts-packages-are-compatible).

## How to test the behavior?
```
Show how to reproduce the new behavior (can be a bug fix or a new feature)
```

## Checklist

- [ ] Did you update CHANGELOG.md with your changes?
- [ ] Have you checked our [Contributing](https://github.com/NeurodataWithoutBorders/pynwb/blob/dev/docs/CONTRIBUTING.rst) document?
- [ ] Have you ensured the PR clearly describes the problem and the solution?
- [ ] Is your contribution compliant with our coding style? This can be checked running `ruff check . && codespell` from the source directory.
- [ ] Have you checked to ensure that there aren't other open [Pull Requests](https://github.com/NeurodataWithoutBorders/pynwb/pulls) for the same change?
- [ ] Have you included the relevant issue number using "Fix #XXX" notation where XXX is the issue number? By including "Fix #XXX" you allow GitHub to close issue #XXX when the PR is merged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aaa4d65f0cc4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.