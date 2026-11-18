# Issue

**Title:** Support multi run experiments and additional 10-20 channels

## Description

# Overview

Update to allow for multirun BIDS conversion, add 10-20 channels, add BIDS to MNE feature with demo, and update the macos builds.

## Contributions

- Add 10-20 channels to `raw_data.py`. Update the tests.
- `BIDS_to_MNE` method added to `convert.py`. This allows loading of entire BIDS collections for processing.
- Updated the demo to show how to package multirun experiments. Add a load bids demo with some example plotting / processing.
- Update m2_install and workflow files to fix mac os build issue.

## Test

- `make test-all`
- loaded converted BIDS data using the demo

## Documentation

- Documentation added where needed

## Changelog

- Is the CHANGELOG.md updated with your detailed changes? Yes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3bab3e3498da`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.