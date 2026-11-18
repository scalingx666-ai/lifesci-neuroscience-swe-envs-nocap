# Issue

**Title:** Add StreamLSL.set_head_sphere and match MNE 1.14 changes

## Description

Fixes the `test pip pre-release` failure seen in #584, where `tests/test_mne.py::test_mne` reports a new mixin method.

- MNE-Python 1.14 adds `SetChannelsMixin.set_head_sphere` (mne-tools/mne-python#14313). `BaseStream.set_head_sphere` wraps it: the stream must be connected and must not be epoched, as with `set_montage` and `set_meas_date`. On MNE < 1.14 it raises a clear error. `Player` inherits the method unchanged, as it does `set_montage`.
- MNE-Python 1.14 also returns `compensation_grade` as `0` instead of `None` when there are no compensated MEG channels (mne-tools/mne-python#14352). The test now accepts both.
- The mixin evolution test is gated on the MNE version, so the minimum-MNE and stable jobs keep passing.

Tested locally on MNE 1.12.1 and on MNE 1.14.0.dev72.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `75ea85d967e4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.