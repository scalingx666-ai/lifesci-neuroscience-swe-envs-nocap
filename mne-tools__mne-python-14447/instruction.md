# Issue

**Title:** ENH: Add scale parameter to Brain screenshot and save_image

## Description

### summary of changes

addresses #14385.

this adds a `scale` parameter to `Brain.screenshot()` and `Brain.save_image()`, so users can export high-resolution images for publications.

- `scale` is passed through the renderer backend to PyVista's `plotter.screenshot(scale=scale)`.
- when `time_viewer=True`, the DPI of the Matplotlib trace is scaled by the same factor, so it matches the size of the 3D canvas.
- added a check in `test_image_screenshot` that the dimensions are doubled and that the image has a high correlation (> 0.95) with a bilinear downsampled version.
- added a towncrier changelog entry.

### checklist

- [x] code style checked with `ruff` and `codespell`
- [x] tests added and passing locally
- [x] changelog entry added in `doc/changes/dev/14385.newfeature.rst`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `24c3922e8a31`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.