# Issue

**Title:** BUG: Fix crash at exit when a widget still observes the scene

## Description

Slicer crashes at exit if a Qt widget still observes the scene at that time: for example, a node selector that a Python script created without a parent and that shows one of the default color nodes.

Reproduce (run with `Slicer --no-main-window --python-script test.py`):

```python
import slicer
w = slicer.qMRMLColorTableComboBox()
w.setMRMLScene(slicer.mrmlScene)
w.setCurrentNodeID("vtkMRMLColorTableNodeGrey")
slicer.util.exit(0)
```

### Cause

Displayable manager factories kept a reference to the application logic. The built-in factories (3D and slice view) are singletons that are deleted during static destruction at process exit, after the application object. Therefore the application logic, including the module logics, was deleted after the application object too. The color logic removes the default color nodes from the scene in its destructor. The node selector reacted to its current node being removed, and the combo box sent an accessibility update after the application object was deleted, which crashed in `QAccessible::queryAccessibleInterface`.

### Fix

`vtkMRMLDisplayableManagerFactory` now keeps only a weak reference to the application logic, so no factory (including factories defined in extensions) keeps the application logic alive. The application logic is owned by the application, so it is deleted while the application object still exists.

All callers in Slicer that set the application logic in a factory already keep their own reference to it (the application, and tests that use `vtkNew`).

### Testing

- Added a test case to `vtkMRMLThreeDViewDisplayableManagerFactoryTest1`, which checks that the (singleton) factory does not keep the application logic alive. The test case fails without the fix.
- The script above now exits normally (exit code 0), with and without the main window.
- Module generic tests, application tests, displayable manager tests, layout manager, slice widget, and 3D view tests, and IO and Colors tests pass (94 tests, Windows, Release build).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4e1fdba30917`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.