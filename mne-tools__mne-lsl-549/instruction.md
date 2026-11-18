# Issue

**Title:** Update abi3 mode and make installable from zipball

## Description

As part of investigating  let's

- [x] Add a little test that the `sdist` version is reasonable (not `0.0.0`) when installed
- [x] Add `git-archival` stuff to make it so that `git clone` of full repo is not necessary to install a correctly versioned `mne-lsl` from `main`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `25d2c334d784`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.