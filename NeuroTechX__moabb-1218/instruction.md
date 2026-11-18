# Issue

**Title:** FIX bids writer: escape acq-calibration/-crosstalk; MILimbEEG NaN header variant

## Description

. Converting Wang2025, Leeuwis2021 and MILimbEEG to BIDS on top of develop crashed before any subject tree was written. Two independent root causes:

### 1. mne-bids reserved `acq-calibration` / `acq-crosstalk` collision (writer)

`mne_bids.BIDSPath` reserves `acquisition="calibration"` and `acquisition="crosstalk"` for MEG fine-calibration / crosstalk sidecar files (`acq-<magic>_meg.json`) and raises

    ValueError: task must be None if the acquisition is "calibration" or "crosstalk", but received: imagery

whenever either value is paired with a non-empty `task`. Four MOABB loaders on develop emit MOABB run labels whose non-numeric suffix is literally `"calibration"`:

- `Wang2025` (`RUN_KEYS = ("0calibration", "1feedback")`),
- `Leeuwis2021` (`"calibration"` -> `"0calibration"` after the loader prefixes a run index),
- `Brandl2020` (`"0calibration"`),
- `Romani_BF2025_ERP` (`"1calibration"`).

Before #1217 the description was routed through the `recording` entity, which mne-bids does not special-case; moving it to `acq-` (correctly, since `rec-` is invalid for EEG core files) made the collision load-bearing. The fix maps the two reserved tokens to short mne-bids-safe aliases on write (`calibration -> calib`, `crosstalk -> xtalk`) and inverts the mapping on read. The round trip is exact for every run label currently emitted on develop (`"0"`, `"12"`, `"1feedback1"`, `"3A"`, `"2run2"`, `"0calibration"`, `"1feedback"`, `"1calibration"`, `"2feedback2"`, `"3feedback3"`) and the legacy `recording-` read fallback (including `recording-calibration` from pre-#1217 caches) is preserved.

Design choice. The alternative — renaming the four loaders' run-label constants — would silently invalidate every user's existing MOABB on-disk cache for those datasets and still leave the reserved tokens as a latent trap for any future loader. Fixing it once in the writer keeps the loader run labels documentary (they still carry the authors' word "calibration") and contains the escape to a two-entry table in `bids_interface.py`.

### 2. MILimbEEG Mendeley v2 NaN-leading header variant (loader)

A dataset-wide scan of all 3719 motor-imagery CSVs confirmed every file is exactly 501 lines, so there is no genuinely short trial in the archive. 3595 files begin with the empty-leading Mendeley v2 header `,0,1,...,15` that the F2 fix (7f14447d4) already detected; **124 files across subjects S4 and S7 (62 each)** instead begin with `NaN,0,1,...,15`. `float("NaN")` succeeds, so the "parse every field" sniff mis-flagged those files as header-less, pandas kept the extra row, and the `four-second` length check raised on every S4/S7 trial. The sniff now also treats a first line with a NaN-or-empty leading cell **and** sequential-column-index remainder as a header. Short trials remain a hard error (no silent zero-pad) because the scan shows 0/3719 real files are short — adding a tolerance would hide a future truly broken file.

Affected trials: **124** (62 CSVs in S4 + 62 CSVs in S7). Zero affected after the fix.

### Tests

- `moabb/tests/test_bids_enrichment.py`: `TestRunMoabbBidsRoundTrip` now round-trips every reserved and non-reserved label currently emitted on develop; two new tests assert the escape pair for both reserved tokens and that BIDSPath construction with `task=imagery` no longer raises; a new legacy test asserts a pre-#1217 cache with `recording-calibration` still reads back to `0calibration`. Full file: 304 passed.
- `moabb/tests/test_clinical_mi.py`: new `test_milimb_parses_mendeley_v2_nan_header` writes the exact `NaN,0,1,...,15` header + 500 data rows and asserts `_read_trial` returns `(16, 500)` in volts with authored amplitudes preserved. All MILimbEEG tests pass except the two `test_milimb_si_and_last_window` cases, which fail on the local mne 1.12.1 venv (`colin27_1020` montage requires mne >= 1.13); unrelated to this PR.
- `pre-commit run --files <touched>` clean.

Blocks the deposits for Wang2025, Leeuwis2021 and MILimbEEG (all three failed convert on #1217 post-merge; retried with this branch).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ac7c01e7f79e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.