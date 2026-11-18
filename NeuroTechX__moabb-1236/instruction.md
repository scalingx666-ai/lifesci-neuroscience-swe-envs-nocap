# Issue

**Title:** Modernise the BIDS layer on mne-bids>=0.20

## Description

Raises the minimum `mne-bids` to 0.20 (no change to the `mne` floor) and removes MOABB code that mne-bids 0.19/0.20 now covers. Net −53 lines in `bids_interface.py`, `base.py` and `thapa2025.py`.

- `_find_matching_paths` wrapper → `mne_bids.find_matching_paths(..., ignore_json=True)`.
- Private `mne_bids.write._find_matching_sidecar` → public `BIDSPath.find_matching_sidecar`.
- `write_raw_bids` now writes annotation extras into `events.tsv` itself; the post-write read/append/rewrite is gone.
- `write_raw_bids(..., readme=False)` instead of letting it write a README and overwriting it.
- `participants.json` descriptions for the standard columns (`participant_id`, `weight`, `height`) come from mne-bids.
- Removed the EDF-conversion warning filter (mne-bids logs this at info level now).
- Thapa2025 finds its files with `find_matching_paths` instead of probing every session × run pair.

Tested locally with mne-bids 0.20.0: the BIDS, NEMAR, cache, download and OpenNeuro suites give the same result before and after the change (2169 passed, 787 skipped); the bump alone breaks nothing.

Still needed (mne-bids `main` has the same behaviour): the `MISCChannelCount` casing fix, the `acq-calibration`/`acq-crosstalk` escaping for EEG, the `PublicationYear` patch, and the private `_open_lock` import. Those can go once mne-bids accepts them upstream.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5a2f13f52113`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.