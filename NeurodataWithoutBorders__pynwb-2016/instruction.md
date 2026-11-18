# Issue

**Title:** Fix gh actions failures

## Description

## Motivation

This PR will fix a couple of our current workflow failures. These changes were originally included in  but I have moved into a separate PR here so that we can merge into dev before the 3.0 release.

These changes will:
* Fix the daily `run_all_tests.yml` workflows that are failing due to some tox environment configuration errors introduced in 
* Fix the python 3.13 gallery test failures due to an import from a deprecated scipy dataset
* Fix the sphinx link check workflows failing due to an update to the hdmf-zarr docs

TODO
- [x] manually trigger `run_all_tests.yml` workflow to check that it runs successfully

## How to test the behavior?
Run the `run_all_tests.yml` workflow

## Checklist

- [x] Did you update CHANGELOG.md with your changes?
- [X] Have you checked our [Contributing](https://github.com/NeurodataWithoutBorders/pynwb/blob/dev/docs/CONTRIBUTING.rst) document?
- [X] Have you ensured the PR clearly describes the problem and the solution?
- [X] Is your contribution compliant with our coding style? This can be checked running `ruff check . && codespell` from the source directory.
- [X] Have you checked to ensure that there aren't other open [Pull Requests](https://github.com/NeurodataWithoutBorders/pynwb/pulls) for the same change?
- [X] Have you included the relevant issue number using "Fix #XXX" notation where XXX is the issue number? By including "Fix #XXX" you allow GitHub to close issue #XXX when the PR is merged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `80fc386c20d7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.