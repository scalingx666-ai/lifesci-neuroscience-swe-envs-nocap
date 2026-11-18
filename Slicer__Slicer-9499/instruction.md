# Issue

**Title:** BUG: Fix test failures specific to Qt 6

## Description

Fixes 7 tests that fail on the macOS arm64 Qt 6.11.1 nightly (recoil) but pass on the Qt 5 builds. Each commit addresses one cause.

### 1. Module widget tests fail to create an OpenGL context

Affects `qSlicerColorsModuleWidgetGenericTest`, `qSlicerTransformsModuleWidgetGenericTest`, `qSlicerVolumeRenderingModuleWidgetGenericTest`, `qSlicerVolumeRenderingModuleWidgetTest1` and `qSlicerVolumeRenderingModuleWidgetTest2`.

These tests created `qSlicerApplication` without calling `qMRMLWidget::preInitializeApplication()`, so the default OpenGL surface format was never set. With Qt 6 on macOS, VTK reported `Unable to find a valid OpenGL 3.2 or later implementation (0.0 found)` and the tests crashed. Every other C++ test that creates an OpenGL view already calls `preInitializeApplication()`.

Fix: call `qMRMLWidget::preInitializeApplication()` before creating the application, and `postInitializeApplication()` after it, in the generic module widget test template and in the two VolumeRendering tests.

### 2. `qSlicerSslTest` gets 200 instead of the expected 301

Qt 6 follows HTTP redirects by default, while Qt 5 does not.

Fix: set `QNetworkRequest::ManualRedirectPolicy` on the request so the test checks the redirect status itself.

### 3. `py_nomainwindow_SubjectHierarchyFolderOpacityTest` fails with `QAction has no attribute named 'menu'`

In Qt 6, `QAction::menu()` is a template function, and the generated PythonQt wrappers have neither `menu()` nor `setMenu()`.

Fix: find the `QMenu` whose `menuAction()` is the opacity action instead.

This is a wider gap in the PythonQt bindings for Qt 6: any script that calls `action.menu()` will hit the same error. Fixing that belongs in PythonQt and is not part of this PR.

### Testing

Each fix was checked against the existing arm64 Qt 6.11.1 build on recoil. The changed test files have not yet been compiled or run as part of a full Slicer build.

- **OpenGL:** Ran the 5 existing test binaries with and without a small library injected (`DYLD_INSERT_LIBRARIES`) that calls `qMRMLWidget::preInitializeApplication()` before `main()`. Without it, all 5 crash with the OpenGL error. With it, all 5 pass with no OpenGL warnings.
- **SSL:** A standalone Qt program requesting `http://slicer.org` and `https://slicer.org`:
  - Qt 6.10.3: 200 by default, 301 with the manual redirect policy.
  - Qt 5.15.2: 301 either way.
- **Python test:** On recoil, the original test fails with the `AttributeError` and the updated test passes. On Qt 5.15.2, the `menuAction()` lookup finds the same menu that `action.menu()` returns.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d835a0ddedca`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.