# Issue

**Title:** Keep mne-bids' MiscChannelCount key in EEG sidecars

## Description

MOABB renamed `MiscChannelCount` (written by mne-bids) to `MISCChannelCount` in every `*_eeg.json`. In the BIDS schema `MISCChannelCount` is the deprecated alias and `MiscChannelCount` is the recommended key (`src/schema/rules/sidecars/eeg.yaml`), so the rename made our sidecars use the deprecated name. This removes the rename (−10 lines).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8474d6275c69`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.