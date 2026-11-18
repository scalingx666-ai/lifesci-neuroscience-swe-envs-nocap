# Issue

**Title:** FIX pass freesurfer_subject_dir to get_surf() in cut_surface()

## Description

## Summary

- Pass `freesurfer_subject_dir` parameter to both `freesurfer.get_surf()` calls in `cut_surface()` function
- Add regression tests to verify the fix

## Problem

The `cut_surface()` function in `cortex/segment.py` accepts a `freesurfer_subject_dir` parameter but was not passing it to the `freesurfer.get_surf()` calls on lines 189-190. This caused a `KeyError` when the `SUBJECTS_DIR` environment variable was not set.

## Solution

Pass the `freesurfer_subject_dir` parameter to both `get_surf()` calls:

```python
ipt, ipoly, inrm = freesurfer.get_surf(
    fs_subject, hemi, "inflated", freesurfer_subject_dir=freesurfer_subject_dir
)
fpt, fpoly, fnrm = freesurfer.get_surf(
    fs_subject, hemi, "fiducial", freesurfer_subject_dir=freesurfer_subject_dir
)
```

## Test plan

- [x] Added regression test verifying `freesurfer_subject_dir` is passed to `get_surf()` calls
- [x] Added test for error handling when `SUBJECTS_DIR` is not set
- [x] Added backward compatibility test when using `SUBJECTS_DIR` environment variable
- [x] All new tests pass: `pytest cortex/tests/test_segment.py -v`
- [x] Full test suite passes (except pre-existing unrelated failure)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3849e061aabf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.