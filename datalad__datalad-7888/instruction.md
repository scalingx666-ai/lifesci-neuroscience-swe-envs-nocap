# Issue

**Title:** BF: create-sibling - don't require git-annex on target for no-annex datasets

## Description

Previously `create-sibling` unconditionally checked for a `git-annex` installation on the target (remote via SSH or local path) and errored out with

    No working git-annex installation.
    It's required on the remote machine to create a sibling

even when the source dataset was a plain-git dataset (created with `--no-annex`, marked by a `.noannex` file) and thus wouldn't invoke any git-annex operations on the target.

Guard the check with a scan of the datasets to process: only require git-annex on the target when at least one of them is an `AnnexRepo`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `48a7b69c53dd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.