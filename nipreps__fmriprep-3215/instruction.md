# Issue

**Title:** FIX: Support lists in bids filter file containing `null` or `*`

## Description

.

## Changes proposed in this pull request

- Update action in CLI for `--bids-filter-file` parameter to loop through lists and check for `null` or `*`.
- Update `Config.bids_filters` in `config.py` to loop through lists and check for `Query.ANY` or `Query.NONE`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `70327827d2da`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.