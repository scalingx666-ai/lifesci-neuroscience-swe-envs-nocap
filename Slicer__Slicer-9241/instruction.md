# Issue

**Title:** BUG: Disable FP exception trapping for ModelMaker/MergeModels tests on macOS

## Description

## Summary

On the macOS nightly dashboard, the `ModelMaker` and `MergeModels` CLI module tests abort with `SIGFPE`. The Linux and Windows nightlies of the same revision pass. This PR disables floating point exception trapping for those two test executables **on macOS only**, leaving it enabled for these tests on Linux/Windows and for every other CLI test on all platforms.

.

## Background: why the tests trap floating point exceptions

The shared CLI module test driver (`Base/CLI/Testing/itkTestMain.h`, and the near-identical `itkTestMainExtended.h`) calls `itk::FloatingPointExceptions::Enable()` at startup, so any CLI module test that performs an invalid operation or a divide-by-zero aborts loudly instead of silently producing `NaN`/`inf`. That is useful and worth keeping in general.

`itk::FloatingPointExceptions::Enable()` unmasks `FE_INVALID` and `FE_DIVBYZERO`. Whether the capability is even compiled in is autodetected by ITK per platform/toolchain (Slicer's SuperBuild sets nothing): macOS gets it via the `fegetenv`/`fesetenv` path, glibc Linux via `feenableexcept`.

## Symptom

Seen on the SlicerPreview dashboard, macOS build (e.g. [build 4272315](https://slicer.cdash.org/builds/4272315), `macOS-clang-17.0.0-64bits-Qt5.15.18-Release`):

- `MergeModelsTest`, `MergeModelsTestVtp`, `MergeModelsTestCompare`
- `ModelMakerStartEndTest`, `ModelMakerLabelsTest`, `ModelMakerGenerateAllThreeLabelsTest`, `ModelMakerGenerateAllThreeLabelsPadTest`, `ModelMakerGenerateAllThreeLabelsHierarchyTest`

The driver's ITK signal handler reports, e.g. for [`MergeModelsTest`](https://slicer.cdash.org/tests/33295940):

```
FPE Signal Caught
signal:  SIGFPE with code FPE_FLTUND
FE_INVALID flag: 0
FE_DIVBYZERO flag: 0
error: [.../MergeModelsTest] exit abnormally - Report the problem.
```

## Why these are false alarms (and why macOS is the only platform affected)

Tracing the `ModelMaker` aborts, every signal fires the instant `vtkDiscreteFlyingEdges3D` (Discrete Marching Cubes) begins, during gradient/normal computation. In one run the codes are, in order, `FPE_FLTOVF` → `FPE_FLTRES` → `FPE_FLTINV` → `FPE_FLTRES`. Three observations:

1. **Most are inherently benign.** `FE_UNDERFLOW` (`FLTUND`) and `FE_INEXACT` (`FLTRES`) fire during normal, correct floating point arithmetic; they are not errors. `vtkMath::Normalize` is zero-guarded, so a flat-region zero gradient does not even produce a divide.
2. **macOS handles FP-exception trapping differently, and this symptom is long-documented.** Several aborts report `MXCSR: 1f80` / `X87CR: 37f` — i.e. all exceptions masked — yet a `SIGFPE` was still delivered, so these are not genuine errors. macOS has no working `feenableexcept` and needs platform-specific handling in ITK (see the `_GNU_SOURCE`/`__APPLE__` special-casing and no-op/fallback paths in [`itkFloatingPointExceptions_unix.cxx`](https://github.com/InsightSoftwareConsortium/ITK/blob/master/Modules/Core/Common/src/itkFloatingPointExceptions_unix.cxx)), whereas glibc Linux uses `feenableexcept`. Notably, "`SIGFPE` with code `FPE_FLTUND`" aborting CLI module tests **on Mac specifically** is a recurring, previously-documented Slicer issue — the Qt5/VTK8 migration listed exactly this for `ModelToLabelMapTest`, `ModelToLabelMapTestLabelValue` and `N4ITKBiasFieldCorrectionTest` ([Documentation/Labs/Qt5-and-VTK8](https://www.slicer.org/wiki/Documentation/Labs/Qt5-and-VTK8)).
3. **The one genuine `FE_INVALID`** is a transient `NaN` inside the stock VTK filter operating on a step-function label image — VTK is not built or run with traps and produces a correct mesh. It is third-party numerics, not a defect in the Slicer modules under test.

Consistent with this, Linux and Windows nightlies of the same revision run these tests with trapping active and **pass** — so the genuine invalid operation is macOS-specific float behavior, and the rest is macOS spurious/over-trapping.

## Fix

Guard the `Enable()` call in the test drivers behind a preprocessor symbol and define it for the affected test executables on macOS only:

```cpp
// itkTestMain.h / itkTestMainExtended.h
#ifndef SLICER_CLI_TEST_DISABLE_FLOATING_POINT_EXCEPTIONS
  itk::FloatingPointExceptions::Enable();
#endif
```
```cmake
# ModelMaker / MergeModels Testing/CMakeLists.txt
if(APPLE)
  target_compile_definitions(${CLP}Test PRIVATE SLICER_CLI_TEST_DISABLE_FLOATING_POINT_EXCEPTIONS)
endif()
```

The driver guard is platform-agnostic; only its *application* is scoped, so the "where" lives in one place and the scope is trivial to change later.

## Prior art

This mirrors a fix I (@RafaelPalomar) previously made upstream in VTK — [vtk!8799 "Disable floating point exceptions on some tests"](https://gitlab.kitware.com/vtk/vtk/-/merge_requests/8799) ([vtk#17683](https://gitlab.kitware.com/vtk/vtk/-/issues/17683)) — where tests tripped benign/spurious FP exceptions and were opted out of trapping at the test-driver level. Together with the long-standing macOS `FPE_FLTUND` test aborts noted above, this is a situation we have hit repeatedly across the VTK/ITK/Slicer stack, and the established remedy has been to disable trapping for the affected tests rather than chase benign exceptions into third-party numerics.

## Surgical (macOS-only) vs. global scope — the tradeoff

I went **macOS-only** deliberately, but it is a close call and easy to widen if reviewers prefer:

**For macOS-only (this PR):**
- The failure is macOS-specific; Linux and Windows pass with trapping on, so those platforms retain real `FE_INVALID`/`FE_DIVBYZERO` coverage for these tests.
- The change states exactly what is true ("macOS trips this").

**For global scope (drop the `if(APPLE)`):**
- The benign-ness is a property of the *code* (the VTK filter / model merge), not the platform — macOS merely also over-traps. A global opt-out encodes that more honestly and keeps test behavior identical across platforms.
- It matches the unconditional approach taken in vtk!8799.
- It is robust to float-behavior drift: if a future compiler/VTK/libm change makes Linux or Windows start tripping the same benign exception, there is no per-platform whack-a-mole.
- The coverage given up is low value: `ModelMaker`/`MergeModels` are thin SlicerExecutionModel wrappers, so the trap there mostly polices VTK rather than Slicer code.

Happy to drop the `if(APPLE)` and make it global if that is preferred.

## Verification

- Confirmed the guard flips behavior end-to-end against the real `ITKCommon`: built without the define → `Enable()` runs; built with `-DSLICER_CLI_TEST_DISABLE_FLOATING_POINT_EXCEPTIONS` → skipped.
- The `SIGFPE` itself only reproduces on macOS, so final confirmation is the macOS dashboard turning green for these tests.

---

*This PR was prepared with AI assistance ([Claude Code](https://github.com/anthropics/claude-code), Anthropic Claude Opus 4.8 / `claude-opus-4-8`). The analysis, code, and references were reviewed by the author.*

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6f30a6bde125`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.