# Issue

**Title:** DOC: Document CLI-test FP exception opt-out rationale in itkTestMain.h

## Description

addressing @lassoan's review request:

> Please copy all the details from the pull request description to the source code (probably the best place is `Base\CLI\Testing\itkTestMain.h`), because both humans and AI agents are much more likely to find information in the source code; and the source code is likely to live much longer than github and PR comments.

This expands the comment at the `itk::FloatingPointExceptions::Enable()` guard in the CLI module test driver so the full rationale lives in-source rather than only in the PR/issue history. It documents:

- Why the driver traps floating point exceptions, and what `Enable()` unmasks (`FE_INVALID` / `FE_DIVBYZERO`).
- How ITK autodetects the capability per platform (glibc `feenableexcept` vs the macOS `fegetenv`/`fesetenv` fallback), with a pointer to `itkFloatingPointExceptions_unix.cxx`.
- Why the `ModelMaker` / `MergeModels` tests opt out on macOS: benign floating point from `vtkDiscreteFlyingEdges3D` (Discrete Marching Cubes) on a label image, plus macOS over-trapping (SIGFPE delivered with all exceptions masked), while Linux/Windows pass.
- The long-standing precedent — the Qt5/VTK8 migration recorded the same `FPE_FLTUND`-on-Mac for `ModelToLabelMapTest` etc., and the same remedy was applied upstream in VTK by @RafaelPalomar in [vtk!8799](https://gitlab.kitware.com/vtk/vtk/-/merge_requests/8799) (vtk#17683).
- The `SLICER_CLI_TEST_DISABLE_FLOATING_POINT_EXCEPTIONS` opt-out mechanism and its current `if(APPLE)` scoping.

Comment-only change; no functional difference. The original fix (#9241) is confirmed on the dashboard: the macOS nightly went from 14 failing tests to 2, with all eight `ModelMaker`/`MergeModels` SIGFPE aborts now passing (the 2 remaining failures are unrelated).

.

---

*This PR was prepared with AI assistance ([Claude Code](https://github.com/anthropics/claude-code), Anthropic Claude Opus 4.8 / `claude-opus-4-8`). The analysis and wording were reviewed by the author.*

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `394cc5296300`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.