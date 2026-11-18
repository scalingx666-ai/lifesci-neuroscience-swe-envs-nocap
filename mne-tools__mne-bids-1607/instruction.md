# Issue

**Title:** FIX: warn instead of raise when subject row missing from participants.tsv

## Description

.

## Summary

When `participants.tsv` exists but does not contain a row for the requested subject, `read_raw_bids` raised a `ValueError` and aborted the read. Now it emits a warning and leaves `raw.info[\"subject_info\"]` empty — the same behavior as when `participants.tsv` is entirely absent.

`_handle_participants_reading` only writes `raw.info[\"subject_info\"]` (sex, hand, height, weight, age, …); it never touches the signal, channels, or timing. So a missing row is functionally equivalent to a missing file, and treating them the same way unblocks reading datasets where the curators forgot to update `participants.tsv` after adding subjects.

## Impact

Datasets observed in a recent EEG/MEG read sweep that this unblocks:

| Dataset | Records affected |
|---|---|
| `ds003645` | 8 (`sub-emptyroom` sessions) |
| `ds004816` | 5 |
| `ds005540` | 3 |
| `ds005697` | 1 |

## Diff

Three files, +15 lines, 0 deletions:

- `mne_bids/read.py` (+4): four-line guard in `_handle_participants_reading` that early-returns with a warning when the subject is absent from the TSV. No signature change, no new parameter.
- `mne_bids/tests/test_read.py` (+10): regression case appended to `test_read_participants_data` — rewrites `participants.tsv` to drop the subject and asserts the warning + empty `subject_info`.
- `doc/whats_new.rst` (+1): bug-fix entry under 0.19.

## Backward compatibility

Anyone catching `ValueError` from `read_raw_bids` for this specific case will lose the exception, but a `RuntimeWarning` is emitted in its place.

## Test plan

- [x] `pytest mne_bids/tests/test_read.py -k participants` — 7 passed locally
- [x] New regression case `test_read_participants_data` covers the missing-row branch

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ae9708cd60bf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.