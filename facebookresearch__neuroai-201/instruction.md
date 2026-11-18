# Issue

**Title:** Onboard Levy2026Noninvasive (SpanishBCBL/DECOMEG) typing dataset

## Description

Adds Levy2026Noninvasive study

## Changes
- **New study**: `neuralfetch/studies/levy2026noninvasive.py` — MEG + EEG keyboard-typing dataset, downloaded from the public Hugging Face release `bcbl190626/SpanishBCBL` (DECOMEG, CC-BY-NC-4.0).
- **Rename** `Levy2025Brain{Eeg,Meg}` → `Levy2026Noninvasive{Eeg,Meg}` across the eeg/meg typing task configs, `debug_study.yaml`, and `transforms.py`.


## Notes
- Study registers via the existing package-level `neuralset.studies` entry point; run a strict-editable reinstall of `neuralfetch-repo` to pick it up.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fb82ceee4793`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.