# Issue

**Title:** COMP: Fix ambiguous call in vtkMRMLAccuratePickerTest

## Description

Fixes the build error that #9456 introduced in \`vtkMRMLAccuratePickerTest\` ([CI run](https://github.com/Slicer/Slicer/actions/runs/38068208700/job/114260084007)):

```
vtkMRMLAccuratePickerTest.cxx:222:35: error: call of overloaded 'SetClippingPlanes(std::nullptr_t)' is ambiguous
```

`vtkAbstractMapper::SetClippingPlanes` has two overloads, taking `vtkPlaneCollection*` and `vtkPlanes*`, so a bare `nullptr` matches both. The test now removes the clipping planes with `RemoveAllClippingPlanes()`.

Checked by compiling the test file (syntax only) with the flags of `MRMLDisplayableManager`, in a WebAssembly toolchain (clang): the version on `main` gives the same error, and this version compiles.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a52273968ff6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.