# Issue

**Title:** DOC: Confirm FFTW already enabled for BCD correlation

## Description

## Summary

- FFTW support is **already enabled** in BRAINSTools and has been for some time.
  `Common.cmake` sets `REQUIRES_FFTW=ON` by default, and `External_ITKv5.cmake`
  passes `-DITK_USE_FFTWF=ON -DITK_USE_FFTWD=ON` to the ITK SuperBuild.
- `BRAINSConstellationDetector` uses `itk::MaskedFFTNormalizedCorrelationImageFilter`
  in `landmarksConstellationDetector.cxx` for landmark template matching, which
  automatically benefits from FFTW when ITK is built with it.
- This PR adds a documentation comment in `Common.cmake` explaining **why** FFTW
  is required, referencing BCD's correlation filter and issue #295.

No functional changes — documentation only.

## Test plan

- [ ] Verify the comment is accurate by inspecting `Common.cmake` line ~107
- [ ] Confirm CI passes (no build changes)

## AI Disclosure

This PR was prepared with AI assistance (Claude). The change is a 3-line CMake
comment; no generated code. The author verified the existing FFTW configuration
by reading `Common.cmake`, `External_ITKv5.cmake`, and
`BRAINSConstellationDetector/src/landmarksConstellationDetector.cxx`.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `68ecdd6d0732`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.