# Issue

**Title:** Remove incorrect "32-channel EEG" comments on MEG/fMRI data_shape

## Description

## What

Removes a copy-paste comment artifact: `# 32-channel EEG` was attached to 5 `data_shape` declarations in `neuralset/events/testing/` where the data is **not** 32-channel EEG.

| File | `data_shape` | Actual modality |
|------|-------------|-----------------|
| `mne2013sample.py` (`Mne2013Sample`) | `(306, 41700)` | 306 MEG sensors × time |
| `mne2013sample.py` (`Mne2013SampleEeg`) | `(60, 41700)` | 60 EEG channels × time |
| `mne2013sample.py` (`Fake2025Meg`) | `(306, 41700)` | 306 MEG sensors × time |
| `test2023fmri.py` (`Test2023Fmri`) | `(20, 20, 20, 10)` | 4D fMRI volume |
| `test2023fmri.py` (`Fake2025Fmri`) | `(91, 109, 91, 80)` | 4D fMRI volume |

## Why remove rather than rewrite the comments

- `data_shape` is already the verified source of truth — `test_study_info` loads each study and asserts the computed shape matches the declared value. The comment carries no information the test doesn't already guarantee, which is exactly why it was free to drift into being wrong.
- The bare tuple is the project's de-facto convention: of 138 `data_shape=` lines, only 6 carry a trailing comment — and 5 of those are this artifact. Removing them aligns with the existing 132 uncommented lines.

## Scope

The one **correct** occurrence — `neuralfetch/studies/chen2023large.py` (genuinely 32-channel EEG) — is intentionally left untouched; it's in a different package and the comment is accurate.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `850801d8dc28`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.