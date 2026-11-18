# Issue

**Title:** [MRG] FIX: map NIRSCWHBO, NIRSCWHBR and NIRSCWOPTICALDENSITY channel types

## Description

PR Description
--------------

Part of #1378 (the three fNIRS types listed there).

BIDS defines the fNIRS channel types `NIRSCWHBO`, `NIRSCWHBR` and `NIRSCWOPTICALDENSITY`, but `_get_ch_type_mapping` only knows `NIRSCWAMPLITUDE` (and `NIRS`). As a result:

- `read_raw_bids` sets `hbo`, `hbr` and optical density channels to `misc`, with a "No BIDS -> MNE mapping found" warning, even when MNE's SNIRF reader had already typed them correctly. We read 324 fNIRS datasets on NEMAR with MNE-BIDS 0.20: 64 came out all-`misc`, and 62 of those use these types in `channels.tsv`.
- writing `channels.tsv` for a raw that has `hbo`, `hbr` or `fnirs_od` channels raises `KeyError`.

This PR adds both directions of the mapping (`hbo` <-> `NIRSCWHBO`, `hbr` <-> `NIRSCWHBR`, `fnirs_od` <-> `NIRSCWOPTICALDENSITY`) and channel descriptions for these types. `write_raw_bids` still infers the `nirs` datatype from `fnirs_cw_amplitude` channels only; I did not change that here.

Tests:
- `test_get_ch_type_mapping`: the four CW fNIRS types map both ways.
- `test_nirs_channel_types_from_tsv`: each type read from `channels.tsv`, for channels the reader had already typed and for `misc` channels.
- `test_channels_tsv_nirs_types`: `channels.tsv` written for `fnirs_od`, `hbo` and `hbr` channels.

I ran them locally with mne 1.13.2, without the MNE testing data. The 8 new tests pass on this branch. On `main` they fail with `KeyError: 'NIRSCWOPTICALDENSITY'`, the "No BIDS -> MNE mapping found" warning, and `KeyError: 'fnirs_od'`. Apart from the new tests, `test_utils.py`, `test_read.py` and `test_write.py` give the same results on `main` and on this branch.

Merge checklist
---------------

Maintainer, please confirm the following before merging.
If applicable:

- [ ] All comments are resolved
- [ ] This is not your own PR
- [ ] All CIs are happy
- [x] PR title starts with [MRG]
- [x] [whats_new.rst](https://github.com/mne-tools/mne-bids/blob/main/doc/whats_new.rst) is updated
- [x] New contributors have been added to [CITATION.cff](https://github.com/mne-tools/mne-bids/blob/main/CITATION.cff)
- [ ] PR description includes phrase "closes <#issue-number>"

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `749e7a0fbdc1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.