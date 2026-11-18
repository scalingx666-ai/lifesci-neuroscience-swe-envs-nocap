# Issue

**Title:** [MRG] ENH: expose mne_bids.open_lock as a public cross-process file lock

## Description

PR Description
--------------

Downstream packages that write to a BIDS root in parallel (MOABB caches subjects with joblib) need the same cross-process lock that mne-bids uses for `participants.tsv` and `dataset_description.json`. Otherwise their writes and mne-bids' writes can collide. Today the only way to get that lock is to import the private `mne_bids._fileio._open_lock`.

This PR exposes it as `mne_bids.open_lock` and adds it to `doc/api.rst`. The behaviour is unchanged. The docstring needed small RST fixes so it renders in the API docs.

Test: one assertion in the existing `test_open_lock_basic` checks the public name.

AI disclosure: I used Claude (Anthropic) as a coding agent to draft the change, the test and the changelog entry. I reviewed and tested the result, and I can explain every line.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a1b22096d19c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.