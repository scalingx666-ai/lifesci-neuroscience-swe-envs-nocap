# Issue

**Title:** PERF: Load VTK Python modules lazily and skip startup scipy import

## Description

The 'vtk.py' shim distributed with VTK eagerly star-imports more than a hundred binary modules, costing ~0.9s at every application startup even though a typical session touches only a fraction of them. Python initialization dominated the fixed part of application startup (~80% of main-thread samples during the core startup phase).

Generate a lazily-loading drop-in replacement at build time (GenerateLazyVtkModule.py): every VTK module is imported once during the build to record which module provides each public attribute, and the generated 'vtk' module resolves attributes on demand through a module __getattr__, importing only the vtkmodules submodule that provides the requested name. The module is placed in bin/Python, which precedes the VTK site-packages directory on the Python path. Submodule imports such as 'import vtk.util.numpy_support' keep working through the same __path__ aliasing used by the eager shim, and 'import vtkmodules.all' remains available to force everything to load.

The VTK modules that provide base classes of the wrapped MRML and Slicer classes are imported explicitly in slicer/__init__.py before the kits, because wrapped classes link their Python bases only if the providing module is already initialized (verified: without this, isinstance(slicer.vtkMRMLScene(), vtk.vtkObject) is False in PythonSlicer). These ~28 core modules cost ~175ms of the original ~810ms; the remaining hundred-plus modules load on first use.

Also restrict the eager numpy/scipy import workaround for issue #5945 to Windows, the only platform that needs it: on macOS and Linux it cost several hundred milliseconds of every startup.

Measured on an M-series MacBook: warm application startup dropped from 5.9s to 3.9s, with 35 of 125 VTK Python modules loaded after startup.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ea1d2e483edb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.