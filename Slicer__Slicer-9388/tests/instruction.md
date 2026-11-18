# Issue

**Title:** BUG: Wrap objects of lazily imported VTK classes as their actual class

## Description

> [!NOTE]
> **Draft pull request.** A prerequisite is to merge  into the `slicer-v9.6.2-2026-05-15-f49a1dbaf` branch of Slicer/VTK and then update the VTK git hash in `SuperBuild/External_VTK.cmake`.

This is a fix for #9382

Since now VTK Python modules are loaded lazily (#9306, #9326), only the modules providing base classes of the wrapped Slicer classes are imported at startup. This is a problem, because for example a method in a PythonQt class may return a VTK object before the corresponding VTK module is imported. If VTK's Python wrapper does not find the exact class then it silently returns a nearest already-imported base class. For example `plotView().chart()` returned a `vtkContextItem` instead of a `vtkChartXY`, so `GetLegend()` raised `AttributeError`, and `vtk.vtkRenderer()` created a `vtkRenderer` instead of a `vtkOpenGLRenderer`. VTK's Python wrapper also cached the base class alias, so that importing the module afterwards did not repair the class for the rest of the session (`vtkmodules.vtkChartsCore.vtkChartXY` became `vtkContextItem`).

Fix: The VTK wrapping now searches a class-to-module table before falling back to a base class, and repairs a cached alias when the class gets registered (Slicer/VTK#65). On the Slicer side, the generated lazy `vtk` module hands the attribute index it already computes at build time to `vtkmodules.register_class_modules`, so the module wrapping a class is imported on first use.

The PR also contains a style improvement: the GenerateLazyVtkModule.py module contained an embedded Python script, which made the code harder to review (the .py file was not in the file system and the placeholder looked like a Python format field). Switched to the convention used throughout Slicer source code (template file uses `.py.in` file extension, the `.py` file is generated during build; use `@placeholder@` syntax instead of `{placeholder}`).

Tested on Windows:
- Reporter's script from #9382 now prints a `vtkChartLegend`; `renderWindow()` and renderers come back as their OpenGL classes.
- `py_SlicerLazyVtkModuleTest` passes, and fails with 2 failures when the table is cleared, so it detects the regression.
- `py_nomainwindow_SlicerSceneObserverTest`, `py_standalonepython_import_slicer`, `py_nowarning_mainwindowTest` pass.
- The generated `vtk.py` is the same as before (except comments)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bb27f76adae4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.