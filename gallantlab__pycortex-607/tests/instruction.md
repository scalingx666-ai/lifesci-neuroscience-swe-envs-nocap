# Issue

**Title:** FIX use PIL instead of ImageMagick to trim headless view whitespace

## Description

## Summary
- Replace ImageMagick `convert -trim` subprocess call with PIL `Image.getbbox()` + `crop()` in `save_3d_views`
- Fixes excessive whitespace in headless-rendered views (e.g. the `plot_panels_headless` example) when ImageMagick is not installed, since the old code silently fell back to no trimming
- PIL is already used throughout pycortex, so no new dependency is added

## Test plan
- [x] Ran the full `plot_panels_headless.py` example locally with `headless=True` and verified all individual views, plot_panels, and predefined panel layouts render with tight cropping and no excessive whitespace

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9d07c81e5f9c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.