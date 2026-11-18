# Issue

**Title:** FIX bids_interface: use acq- entity and nest HardwareFilters for bids-validator

## Description

Running the official bids-validator (`@bids/validator@^2`) on
`Dataset.convert_to_bids()` output across 9 datasets surfaced two
schema errors. Both are in `moabb/datasets/bids_interface.py`.

### 1. `JSON_SCHEMA_VALIDATION_ERROR` on `HardwareFilters`

`_build_sidecar_enrichment` could write
`{"HardwareFilter": "0.1 Hz high-pass and 50 Hz notch (online, hardware)"}`
or `{"HardwareFilter": {flat dict}}`. The validator schema says every
top-level value of `HardwareFilters` must be an object (or the whole
field must be the exact string `"n/a"`).

Fixed:
- `acq.filters` as a string → `{"HardwareFilter": {"Description": "<string>"}}`
- `acq.filters` as a flat dict → wrapped so the outer value is an object:
  `{"HardwareFilter": {k: str(v) ...}}`
- `acq.filters` already fully nested → unchanged.

### 2. `ALL_FILENAME_RULES_HAVE_ISSUES` on `*_eeg.edf`

MOABB run labels like `"1feedback1"` were split by `run_moabb_to_bids`
into `run=1, recording=feedback1`, producing
`sub-7_ses-0_task-imagery_run-1_recording-feedback1_eeg.edf`. The
`recording-` (`rec-`) entity is only valid for `_physio`/`_stim`, not
for `_eeg`/`_events`/`_channels`.

The description is now stored in the `acquisition` (`acq-`) entity,
which is valid for all three suffixes and round-trips exactly for
labels like `"0"`, `"1feedback1"`, `"3A"` (new parametrised test).

### Cache compatibility (please veto if undesired)

Existing caches on disk were written with `recording-<desc>`.
`run_bids_to_moabb` now accepts either `path.acquisition` or
`path.recording`, so old caches keep reading back to the same MOABB run
label — no silent re-download. New writes use `acq-`. If you want a
hard version bump instead (force a cache rebuild), drop the three
`path.recording` fallback lines in `run_bids_to_moabb`.

### Tests

- `moabb/tests/test_bids_enrichment.py` — new `TestRunMoabbBidsRoundTrip`
  (pure numeric, no `recording` key for `"1feedback1"`/`"3A"`,
  parametrised round-trip, legacy `rec-` fallback) and updated
  `TestBuildSidecarEnrichment` filters-fallback cases.
- `pytest moabb/tests/test_bids_enrichment.py` → 296 passed.
- `pre-commit` → clean on the touched files.

Closes/relates to the bids-validator run — this PR plus a validator
re-run should flip both error families to zero on the 9 datasets.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `64fa04e01d9f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.