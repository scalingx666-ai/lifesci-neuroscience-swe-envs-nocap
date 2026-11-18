# Issue

**Title:** fix: resolve video save path without os.chdir

## Description

## Summary
 by removing `os.chdir()` from `VideoMaker.make_video()` and switching to explicit absolute paths throughout the video pipeline.

## Root Cause
`make_video()` called `os.chdir(self.save_fld)` so ffmpeg could locate the output file using only a bare filename. The CWD was restored at the end — but only on the happy path. Any exception during rendering left the process CWD permanently mutated, causing subsequent path operations in the caller's script to silently resolve to the wrong location. This explains the intermittent nature of the bug.

`_video.py` compounded this by passing only a filename to ffmpeg, making output placement entirely dependent on global CWD state.

## Changes
- `brainrender/video.py`: removed `curdir = os.getcwd()` and both `os.chdir()` calls; `Video()` now receives a fully-resolved absolute path via `self.save_fld.resolve()`; `compress()` updated to match
- `brainrender/_video.py`: ffmpeg input dir and output file both quoted to handle paths with spaces
- `tests/test_video.py`: assertions updated to validate resolved absolute paths
- tests/test_video.py::test_compress PASSED
## Verification
```
tests/test_video.py::test_video PASSED
tests/test_video.py::test_video_custom PASSED
tests/test_video.py::test_animation PASSED
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2322e0f8d7f4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.