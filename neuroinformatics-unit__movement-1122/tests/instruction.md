# Issue

**Title:** Round frame numbers when exporting VIA tracks with time in seconds

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

When a bboxes dataset has time in seconds, `to_via_tracks_file` gets the frame numbers back with `(ds.time.values * ds.fps).astype(int)`. `time * fps` isn't always an exact integer in floating point (`29 / 25 * 25 == 28.999999999999996`), so `astype(int)` truncates some frames to the previous frame number. With 25 fps, frames 29 and 57 are written as `028.png` and `056.png`, two frames share a filename, and loading the file back with `use_frame_numbers_from_file=True` fails with "Duplicate track IDs". Details and a reproduction are in #1121.

**What does this PR do?**

- Uses `np.rint(ds.time.values * ds.fps).astype(int)` in `to_via_tracks_file` and in `_check_frame_required_digits`, which computes the largest frame number the same way. `to_sleap_analysis_file` already uses `np.rint` for this conversion.
- Adds `test_to_via_tracks_file_frame_numbers_from_seconds`, which exports 130 frames at 25, 29.97 and 30 fps, then checks the frame numbers in the filenames and that the file loads back with the same `time` values. The existing `valid_bboxes_dataset_in_seconds` fixture only has 10 frames at 60 fps, where this doesn't happen (the first affected frame at 60 fps is 123).

Datasets with time in frames are not affected.

## References



## How has this PR been tested?

- The new test fails on `main` for all three fps values and passes with the fix.
- The rest of `test_save_bboxes.py` and `test_load_bboxes.py` behaves the same before and after the change. I couldn't download the GIN sample data here, so the tests that need the sample files couldn't run locally, and I'm relying on CI for those.
- `pre-commit run` on the changed files passes.

## Is this a breaking change?

No. Frame numbers that were already correct are unchanged; only the ones that were off by one change.

## Does this PR require an update to the documentation?

No.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

AI-assisted: I used Claude to help trace the bug and draft the test, then reviewed the change and ran the tests myself.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `81391d04be5b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.