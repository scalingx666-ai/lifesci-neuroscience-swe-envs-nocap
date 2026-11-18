# Issue

**Title:** [FIX] Fixes pysurfer opacity bug

## Description

Requires nipy/pysurfer@dd9f3b5 (or newer).

Also, modify `site-packages/vtkmodules/qt/__init__.py` file and make this change:

```diff
# QVTKRWIBase, base class for QVTKRenderWindowInteractor,
# can be altered by the user to "QGLWidget" in case
# of rendering errors (e.g. depth check problems, readGLBuffer
# warnings...)
-QVTKRWIBase = "QWidget"
+QVTKRWIBase = "QGLWidget"
```

and modify `site-packages/tvtk/pyface/ui/qt4/QVTKRenderWindowInteractor.py` and make this change:

```diff
if PyQtImpl == "PyQt5":
    if QVTKRWIBase == "QGLWidget":
-        try:
-            from PyQt5.QtWidgets import QOpenGLWidget as QGLWidget
-        except:
-            from PyQt5.QtOpenGL import QGLWidget
+       from PyQt5.QtOpenGL import QGLWidget
```

Make sure you have `vtk>=8.2` and `pyqt>=5.9.2` installed. Now you shouldn't get weird speckling when plotting with `nnplot.plot_fsaverage()`!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8e02a5cab410`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.