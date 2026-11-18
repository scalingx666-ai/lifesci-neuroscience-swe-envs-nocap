# Issue

**Title:** FIX: Preserve orig_time and onset when loading CSV annotations with orig_time=None

## Description

#### reference issue (if any)



#### what does this implement/fix?

when annotations are created with `orig_time=None`, `Annotations.to_data_frame()` stores onsets in `.csv` files relative to the default `1970-01-01 00:00:00` epoch.

previously, `_read_annotations_csv()`:
1. checked `if timestamp == pd.Timestamp(_handle_meas_date(0)).astimezone(None):` on `df["onset"].values[0]`. when the first annotation had `onset[0] > 0` (e.g. `onset=[2.5]`), this check failed, incorrectly assigning `orig_time = 1970-01-01 00:00:02.500000+00:00` instead of `None`.
2. calculated onsets as `(onset_dt - onset_dt[0]).dt.total_seconds()`, subtracting the first annotation's timestamp from all rows. this corrupted `onset[0]` to `0.0` and shifted all subsequent onsets.

this pr:
- detects whether onset timestamps originate from the `1970-01-01` epoch date and restores `orig_time = None`.
- computes onsets relative to the `1970-01-01` epoch (`onset_dt - epoch`) when `orig_time is None`, preserving the original onset values across csv save/load round-trips.
- retains existing behavior when `orig_time` is a valid recording timestamp.
- extends the existing `test_io_annotation` test in `mne/tests/test_annotations.py` to assert round-trip equality when `orig_time is None` with non-zero onsets.

#### additional information

- tested locally: all 172 tests in `mne/tests/test_annotations.py` and annotation tests in `mne/io/tests/test_raw.py` pass.
- verified pre-commit hooks (`ruff`, `ty`, `codespell`, `rstcheck`) and changelog entry names checker.

#### ai assistance disclosure

i used google antigravity to help investigate the root cause in `_read_annotations_csv`, draft the minimal patch, and verify the test suite and pre-commit checks locally.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `256f27dfb28b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.