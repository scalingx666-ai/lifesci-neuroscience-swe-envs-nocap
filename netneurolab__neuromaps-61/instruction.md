# Issue

**Title:** [FIX] Fixed bug in inverse_transform function

## Description

This PR fixes a bug in the `inverse_transform` function, which is discussed in . As described, we fixed the issue by removing the self.drop argument from the function call to `parcel_to_vertices`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8aaa841c3f37`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.