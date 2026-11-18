# Issue

**Title:** Center Muse S Athena EEG samples around zero

## Description

## Summary

- subtract the fixed 14-bit midpoint (`1 << 13`) before scaling Muse S Athena EEG samples
- apply the same centering to both EEG and other-channel mappings in the Athena EEG payload

## Why

Athena EEG samples are unpacked as unsigned 14-bit values. A zero-level input is therefore encoded around 8192, so scaling the raw code directly leaves an approximately 725 µV DC pedestal after the scale-factor correction from #855.

This changes the output representation from unsigned, offset values to zero-centered EEG values. It does not remove electrode drift or other physiological low-frequency/DC components.

Fixes the midpoint-handling part of #854.

## Validation

- verified the mapping endpoints and center: raw 0 → approximately -725 µV, raw 8192 → 0 µV, raw 16383 → approximately +725 µV
- confirmed the diff is limited to the midpoint constant and the two Athena EEG channel assignments
- full platform checks will run in CI

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `145fe5bde8a5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.