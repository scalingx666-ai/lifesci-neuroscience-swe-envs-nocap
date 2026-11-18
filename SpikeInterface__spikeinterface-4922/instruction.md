# Issue

**Title:** Fix saving a recording when only some segments have a `t_start`

## Description

.

When only some segments have a `t_start`, for example after `append_recordings` or `shift_times(..., segment_index=1)`, `get_segment_t_starts` returns a list such as `[None, 100.0]`. `NumpyRecording`, `SharedMemoryRecording` and `BinaryRecordingExtractor` called `float()` on every entry, so `save` raised a `TypeError` for the binary and memory formats.

This PR keeps the `None` entries in these three constructors, rather than replacing them with `0.0`, so that "no start time" stays distinct from "starts at 0", as zarr already does with `NaN`. It also covers the two smaller points of the issue:

- `SharedMemoryRecording` no longer raises `AttributeError` in `__del__` after a failed constructor. With `main_shm_owner=True`, it now releases the buffers it had attached.
- `ZarrRecordingExtractor` returns `t_start` as a `float` instead of a 0-d array.

Not addressed: the binary save with a time vector on only some segments (#4923), and `save` silently ignoring unknown keywords such as `shared_memory`.

Claude helped me with this PR.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4e28d878e240`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.