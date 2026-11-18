# Issue

**Title:** [FIX] Accept MiscChannelCount in EEG/Motion sidecars; deprecate MISCChannelCount alias

## Description

.

## Problem

The EEG sidecar's `EEGRecommended` rule names the misc-channel-count key as `MISCChannelCount`, but the rest of the schema and the docs use `MiscChannelCount`:

| Source | Key |
| --- | --- |
| `src/schema/rules/sidecars/eeg.yaml:73` (`EEGRecommended`) | **`MISCChannelCount`** |
| `src/schema/rules/checks/eeg.yaml` (`MiscChannelCountReq`) | `MiscChannelCount` |
| `src/schema/rules/sidecars/meg.yaml:101` | `MiscChannelCount` |
| `src/schema/rules/sidecars/ieeg.yaml:79` | `MiscChannelCount` |
| `src/schema/rules/sidecars/motion.yaml:64` | **`MISCChannelCount`** |
| `src/modality-specific-files/electroencephalography.md:179` (example) | `MiscChannelCount` |
| `bids-validator@1.x` legacy `eeg.json` schema (`additionalProperties: false`) | `MiscChannelCount` |

The contradiction means writers cannot satisfy both rules at once: writing `MiscChannelCount` triggers a missing-recommended warning, writing `MISCChannelCount` triggers `JSON_SCHEMA_VALIDATION_ERROR (code 55)` against the legacy validator and silences the consistency check. Reproducer / impact: mne-tools/mne-bids#1546.

## Fix

Make `MiscChannelCount` the canonical recommended key in both EEG and motion sidecars (matching the rest of the schema, the docs example, and the legacy validator), and keep `MISCChannelCount` as a `deprecated` alias in both so datasets in the wild that already use that spelling keep validating.

```yaml
EEGRecommended / motionRecommended:
  fields:
    ...
    MiscChannelCount: recommended
    MISCChannelCount: deprecated
```

The deprecation note lives on the field definition itself (`src/schema/objects/metadata.yaml`), so the glossary entry for `MISCChannelCount` points readers at the canonical `MiscChannelCount` wherever the field is referenced.

## Validator behaviour

Checked with `bids-validator@2.4.1` against the updated schema:

- Datasets using `MiscChannelCount` validate cleanly.
- Datasets using the deprecated `MISCChannelCount` are accepted without error (existing datasets keep passing). bids-validator v2 does not currently emit a dedicated `DEPRECATED_SIDECAR_KEY` warning for any `deprecated`-level sidecar field (e.g. `DCOffsetCorrection`, `HardcopyDeviceSoftwareVersion`) — that gap is pre-existing and belongs upstream in `bids-standard/bids-validator`, not in this spec PR.

cc @effigies (since #1319 introduced the EEG check rules)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `449121e1bb1c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.