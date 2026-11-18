# Issue

**Title:** ENH: Add read_epochs_bids for pre-epoched EEGLAB datasets

## Description

Closes (in part) #1176.

## Summary

Adds `mne_bids.read_epochs_bids()` for reading BIDS datasets whose data sidecar JSON declares `RecordingType: \"epoched\"`. EEGLAB `.set` is supported in this first PR — that covers every OpenNeuro epoched dataset I'm aware of.

`read_raw_bids()` now peeks at `RecordingType` and raises an informative `RuntimeError` pointing to the new function rather than silently mis-loading epoched data as `Raw`.

The shared sidecar attachment (channels / electrodes / coordsystem / info / scans / participants) is factored into a private `_attach_sidecars()` used by both readers, so the new public function stays small.

## Why no derivatives layout?

The BIDS EEG spec already allows `RecordingType: \"epoched\"` in the main subject tree (not under `derivatives/`); every OpenNeuro example I tested uses that layout. Discussion on #1176 (Arno + drammock) confirmed this is spec-compliant. The broader \"derivatives subdir\" story Christian raised in the original issue is orthogonal and deferred.

## Real-world validation

Pulled one subject from each of the 13 OpenNeuro datasets  and ran the new reader end-to-end:

| Dataset | Result |
|---|---|
| ds003805 | ❌ upstream MNE (`IndexError` at `eeglab.py:705`) |
| ds004785 | ✅ 48 ep · 32 ch · 500 Hz |
| ds004368 | ❌ upstream MNE (`AttributeError: 'Bunch' object has no attribute 'eventtype'`) |
| ds004771 | ✅ 480 ep · 34 ch · 256 Hz |
| ds004554 | ✅ 270 ep · 99 ch · 1000 Hz |
| ds004520 | ✅ 784 ep · 62 ch · 250 Hz |
| ds004521 | ✅ 896 ep · 62 ch · 250 Hz |
| ds007081 | ❌ upstream MNE (`IndexError` at `eeglab.py:705`) |
| ds004519 | ✅ 864 ep · 62 ch · 250 Hz |
| ds005946 | ✅ 336 ep · 60 ch · 1000 Hz |
| ds006367 | ✅ 562 ep · 30 ch · 1000 Hz |
| ds006370 | ✅ 1280 ep · 30 ch · 1000 Hz |
| ds004166 | ❌ upstream scipy (`buffer is too small`; matches mne-tools/mne-python#10012) |

**9/13 read end-to-end including all sidecars.** Confirmed the 4 failures by re-running each on a second subject and via bare `mne.io.read_epochs_eeglab` — they fail identically without `mne-bids` involved, so they need MNE-side fixes.

The validation surfaced one real bug in this PR: `_handle_scans_reading` calls `inst.set_meas_date(None)`, and MNE's implementation pokes `inst.annotations._orig_time` — which is `None` on `Epochs` by default. Added a one-line guard in `_attach_sidecars`.

## Followups (separate PRs)

- `.fif` epoched reader (one line in the dispatch table once a fixture exists).
- Segmented epoching of EDF/BDF/BrainVision via the `EpochLength` sidecar field.
- Per-epoch events.tsv → `epochs.metadata` mapping (currently we keep MNE's EEGLAB-derived events).

## Test plan
- [x] `pytest mne_bids/tests/test_read_epochs.py` (new, 1 test, exercises round-trip + the `read_raw_bids` rejection)
- [x] `pytest mne_bids/tests/test_read.py` (75 existing tests still pass — `_attach_sidecars` is byte-equivalent to the original sequence, just hoisted into a helper)
- [x] Manual validation against 13 OpenNeuro datasets (table above)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d6d892802ce1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.