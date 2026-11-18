# Issue

**Title:** Update the HED and BIDS versions in HED examples

## Description

This PR updates the `HEDVersion` to 8.4.0 and `BIDSVersion` to 11.1.1 in the `dataset_description.json` files of the examples that use HED. These are the latest versions as of this PR. This PR verifies that these examples work with the latest versions and encourages users to use the latest versions.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8bb0cdd090e2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.