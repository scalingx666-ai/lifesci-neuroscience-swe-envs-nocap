# Issue

**Title:** Tell codespell to ignore "assertIn"

## Description

## Motivation

The latest version of codespell causes 10+ new check failures because it introduced the check/correction `assertIn ==> asserting, assert in, assertion`. We use `assertIn` in tests.
This PR tells codespell to ignore the word "assertIn".

See 

This is super minor and I think it does not merit a changelog entry.

## Checklist

- [ ] Did you update CHANGELOG.md with your changes?
- [x] Have you checked our [Contributing](https://github.com/NeurodataWithoutBorders/pynwb/blob/dev/docs/CONTRIBUTING.rst) document?
- [x] Have you ensured the PR clearly describes the problem and the solution?
- [x] Is your contribution compliant with our coding style? This can be checked running `flake8` from the source directory.
- [x] Have you checked to ensure that there aren't other open [Pull Requests](https://github.com/NeurodataWithoutBorders/pynwb/pulls) for the same change?
- [x] Have you included the relevant issue number using "Fix #XXX" notation where XXX is the issue number? By including "Fix #XXX" you allow GitHub to close issue #XXX when the PR is merged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2f851df5bbb3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.