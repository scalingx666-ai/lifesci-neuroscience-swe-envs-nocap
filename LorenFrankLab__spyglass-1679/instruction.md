# Issue

**Title:** DLC/Video tri-part makes

## Description

# Description

Converts the three position video tables to the tri-part `make` described in
`docs/src/Features/Populate.md`. Each is a long-running video render that
previously held a database transaction open for the entire encode; splitting
them means the transaction covers the second fetch case and the insert.

- Separates `DLCPosVideo`, `TrodesPosVideo`, and `PositionVideo` to tri-part `make`
    - `src/spyglass/position/v1/position_dlc_selection.py`: `DLCPosVideo.make`
        split into `make_fetch`/`make_compute`/`make_insert`, with
        `_parallel_make = True` (`VideoMaker` runs its own `ProcessPoolExecutor`).
        `make_insert` now wraps the path in `Path(...)` before `.exists()`
    - `src/spyglass/position/v1/position_trodes_position.py`:
        `TrodesPosVideo.make` split, also `_parallel_make = True`. The two
        `has_video=False` early returns became `return [False, None]` from
        `make_compute`, following the `common_ephys.LFP` precedent. The
        `limit and not test_mode` debug path returned *without* inserting, so
        `make_compute` returns `has_video=None` and `make_insert` skips,
        preserving that.
    - `src/spyglass/common/common_position.py`: `PositionVideo.make` split. No
        `_parallel_make` — its `make_video` is a plain cv2 loop. `make_fetch`
        now reads the video NWB inside a `with` block and materializes
        `external_file[0]`, `timestamps`, and `device.meters_per_pixel`; the old
        code leaked the `NWBHDF5IO` handle and would otherwise have put an
        on-disk pynwb object into the hashed fetch payload.
- Fixes handler loss in the DLC file logger
    - `src/spyglass/position/v1/dlc_utils.py`: `file_log` removed
        `logger.handlers[0]` by position and restored the module-level
        `stream_handler` in its place. Nested calls therefore accumulated
        duplicate stream handlers and dropped any handler another caller had
        added. It now removes and restores the same handler objects by identity.
- Pins the DLC extra to the TensorFlow line
    - `pyproject.toml`: `deeplabcut[tf]<3`. 3.x drops the TensorFlow backend for
        PyTorch, and spyglass's DLC pipeline targets the TF backend.

## Notes for review

**Behavior change.** `make` is now a generator, so a `return` value can no
longer reach a direct caller. Each `make_insert` stashes the `VideoMaker` on
`self._video_maker` instead — relevant only to the `limit` debug path, which
previously returned the object. `_info_msg` lines in `make_fetch` log twice per
key, once per fetch pass.

# Checklist:

- [X] N/A. If this PR should be accompanied by a release, I have updated the `CITATION.cff`
- [X] N/A. If this PR edits table definitions, I have included an `alter` snippet for release notes. No table definitions change; only `make` is restructured.
- [X] If this PR makes changes to position, I ran the relevant tests locally.
- [X] N/A. If this PR makes user-facing changes, I have added/edited docs/notebooks to reflect the changes. The tri-part pattern is already documented in `docs/src/Features/Populate.md`.
- [X] I have updated the `CHANGELOG.md` with PR number and description.

## Test results

Run in a `dlc` conda env (python 3.10.20, datajoint 0.14.9, deeplabcut 2.3.11,
tensorflow 2.11.1) against **fresh** databases, so every video table actually
populated rather than short-circuiting on existing rows:

| Scope | Result |
| --- | --- |
| `tests/position/v1/test_dlc_sel.py` | 3 passed, 2 skipped |
| `tests/position/` + `tests/common/test_position.py` | 105 passed, 15 skipped |

All three converted tables were confirmed to do real work in the fresh-database

| Table | Evidence |
| --- | --- |
| `DLCPosVideo` | `Making video: TEST_VID_2.mp4 in batches of 512` → `Finished video`; 1 `DLCPosVideoSelection` row → 1 `DLCPosVideo` row |
| `TrodesPosVideo` | `Making video: minirec20230622__01_single_led.mp4` → `Finished video` |
| `PositionVideo` | two cv2 frame loops (274 and 266 frames); the test asserts 2 rows |

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5f43f89b535b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.