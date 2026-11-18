# Issue

**Title:** BUG: Rename vtkMRMLFileIOManager Register and Unregister methods

## Description

`vtkMRMLFileIOManager::Register(vtkMRMLFileIOHandler*)` hides `vtkObjectBase::Register(vtkObjectBase*)` in C++. In Python, however, `fileIOManager.Register(handler)` calls `vtkObjectBase::Register`. The handler is not registered, the reference count of the manager is incremented (so the manager leaks), and there is no error or warning.

This renames the methods to `RegisterHandler` and `UnregisterHandler`. `Unregister` did not have the problem, because the VTK method is `UnRegister`, but it is renamed too so that the two names match. `RegisterReader`, `RegisterWriter` and `RegisterNodeWriter` are unchanged.

All callers (application logic, `qSlicerCoreIOManager`, `qSlicerScriptedLoadableModule`), tests, the `ScriptedFileIO` docstring and the developer guide are updated. `SlicerScriptedFileReaderWriterTest` now registers its reader from Python with `RegisterHandler()` and checks that the reader is actually registered.

The methods were introduced recently, in ab80d001e3 (file reader and writer logic moved to VTK classes), so no deprecated aliases are kept.

Found in the web build of Slicer (SlicerWeb), where a Python reader registered with `Register()` was silently missing. Tested there: readers and writers register and unregister through the new methods, including when a scripted module is reloaded. The desktop tests have not been run yet.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0ac8f3191a09`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.