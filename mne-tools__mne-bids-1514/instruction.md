# Issue

**Title:** ENH: Add EEGLAB and EEGLAB-HJ coordinate system support

## Description

## Summary

-  
- 

- Add `EEGLAB` and `EEGLAB-HJ` to `BIDS_EEG_COORDINATE_FRAMES`, which automatically propagates to `ALLOWED_SPACES["eeg"]` and `ALLOWED_SPACES["meg"]`
- Map both to MNE's `ctf_head` frame in `BIDS_TO_MNE_FRAMES` — both use ALS orientation identical to CTF (FieldTrip confirms with `ctf2eeglab = eye(4)`)
- Add coordinate frame descriptions to `BIDS_COORD_FRAME_DESCRIPTIONS`
- `EEGLAB-HJ` differs from `EEGLAB` only in landmark choice (helix-tragus junction vs pre-auricular points)

References:
- BIDS Appendix VIII: https://bids-specification.readthedocs.io/en/stable/appendices/coordinate-systems.html
- FieldTrip coordinate systems FAQ: https://www.fieldtriptoolbox.org/faq/coordsys/

## Test plan

- [x] `pytest mne_bids/tests/test_read.py::test_handle_eeg_coords_reading -xvs` — verifies both EEGLAB frames are accepted and map to `ctf_head`
- [x] `pytest mne_bids/tests/test_dig.py -x` — confirms no regressions in dig handling

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1e83c8930b8b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.