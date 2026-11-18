# Issue

**Title:** Add conditional check to fix bug when using PollingObserver

## Description

This PR addresses a bug that arises when the user specifies `USE_POLLING_OBSERVER = True` in `config.py`. Line 1136 was instantiating the class `Observer()` instead of `PollingObserver()`. I added a conditional check of the config on new lines 1136-1140 to use the appropriate class and have confirmed it works for our lab's use cases. Related to issue #156

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `98ce9746f1b8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.