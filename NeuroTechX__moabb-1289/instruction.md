# Issue

**Title:** Peterson2020: every load failed under the default provider (NEMAR mirror events.tsv codes)

## Description

With the default `"auto"` provider, every Peterson2020 load fails with `ValueError: Could not find any of the events you specified.`

The default path reads NEMAR's raw mirror `on003810`, which ships the BIDS `*_events.tsv` sidecars. When a sidecar is present, `mne_bids.read_raw_bids` replaces the EDF annotations (`OVTK_GDF_Right`, `OVTK_GDF_Tongue`, ...) with the sidecar `value`s `7` and `9`, and the loader's rename finds neither. The OpenNeuro S3 path downloads only `eeg.edf`, `eeg.json` and `channels.tsv`, never `events.tsv`, so it was unaffected. That is why the existing tests (which mock the transport) stayed green.

Checked on the mirror (Voyager Job, all subjects): every value-7 event sits on an `OVTK_GDF_Right` annotation (845/845), and every value-9 event on an `OVTK_GDF_Tongue` annotation (845/845).

### Change
`_ANNOT_TO_NAME` also maps `"7"` to `motor_imagery` and `"9"` to `rest`.

### Verification
| Dataset | develop: class, upstream hosts | this branch: class | sessions/runs develop -> branch |
|---|---|---|---|
| Peterson2020 | error (-) | nemar_only | -/- -> 1/4 |

### Tests
`test_peterson_units_native_stim_and_boundary_trials` now runs with both codings. The `bids-events-tsv` case fails without the change.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2dc01816d5bc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.