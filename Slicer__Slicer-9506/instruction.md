# Issue

**Title:** BUG: Fix MarkupsPropertiesLabelTest crash on exit on macOS

## Description

`py_MarkupsPropertiesLabelTest` fails every night on both macOS dashboards (Intel Qt 5 and arm64 Qt 6). All 9 tests pass, but Slicer then segfaults on exit:

```
Ran 9 tests in 1.380s
OK
error: [.../Slicer.app/Contents/MacOS/./Slicer] exit abnormally - Report the problem.
```

The crash is a VTK bug on macOS. `tearDown()` calls `Finalize()` on the test's `vtkRenderWindow`. `vtkCocoaRenderWindow::Finalize()` closes the `NSWindow` but leaves the `vtkCocoaGLView` pointing to the render window. The closed window is released later by the application event loop, after the render window has been deleted, and the view then calls `SetDPI()` on the deleted render window.

The VTK bug is fixed in Slicer/VTK#68. This PR removes the `Finalize()` call from the test, so the test passes now and stays independent of that fix. The render window destructor releases the window correctly.

### Testing

On the macOS arm64 dashboard machine (Qt 6.11.1), each version of the test was run 3 times:
- **With `Finalize()`:** 9/9 pass, then segfault on exit every time.
- **With this change:** 9/9 pass and a clean exit every time.

On Windows (MSVC 2022, Qt 5.15.2, Release), where the test already passed:
- **With this change:** passed 3 of 3 times through CTest, with all 9 tests OK.
- **Output:** identical to the version on `main` except for a temporary folder name, so no new warnings, errors or leak reports.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5d32f6cdabd5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.