# Issue

**Title:** MAINT: Migrate ZapLine to mne-denoise

## Description

### Before merging …

- [x] Changelog has been updated (`docs/source/dev.md.inc`)


.

This PR migrates ZapLine line-noise removal from `meegkit` to `mne-denoise`.

It also:
- adds `zapline_extra_kws` for advanced `mne_denoise.zapline.ZapLine` options;
- removes `zapline_iter`, which has no direct replacement;
- prevents ZapLine and notch filtering from being enabled together;
- removes the old `meegkit` dependency and related warning handling.

The migration was validated with the Matching Pennies dataset and the existing test suite.

Luna Xhigh was used to help with impelemtation; all code was verified by me.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e256fa9be6d8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.