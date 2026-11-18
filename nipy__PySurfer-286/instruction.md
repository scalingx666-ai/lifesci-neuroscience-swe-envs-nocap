# Issue

**Title:** Fix rendering of overlay on some graphic chipsets.

## Description

Ok. More digging and potential solutions.

An undocumented workaround for various rendering bugs in some graphics drivers is to hack your local [`site-packages/vtkmodules/qt/__init__.py`](https://github.com/Kitware/VTK/blob/master/Wrapping/Python/vtkmodules/qt/__init__.py#L33-L37) file and make this change:

```python
# QVTKRWIBase, base class for QVTKRenderWindowInteractor,
# can be altered by the user to "QGLWidget" in case
# of rendering errors (e.g. depth check problems, readGLBuffer
# warnings...)
QVTKRWIBase = "QGLWidget"  # Changed from "QWidget" -> "QGLWidget"
```

Code relying on `vtkmodules`, such as Mayavi and pyvista, will [check the `QVTKRWIBase` variable and try to do the right thing accordingly](https://github.com/enthought/mayavi/blob/master/tvtk/pyface/ui/qt4/QVTKRenderWindowInteractor.py#L61-L66). Unfortunately, for some reason, it decided to do this:

```python
if PyQtImpl == "PyQt5":
    if QVTKRWIBase == "QGLWidget":
        try:
            from PyQt5.QtWidgets import QOpenGLWidget as QGLWidget
        except:
            from PyQt5.QtOpenGL import QGLWidget
```
I don't know where the `QOpenGLWidget`/`QGLWidget` confusion comes from, but in my case, it needs to be `QGLWidget`, otherwise everything crashes. Removing this try/catch construction and just importing `QGLWidget` fixes this at my end.

This gets me up to this point:

![fig2](https://user-images.githubusercontent.com/428273/74261026-719afa00-4cf2-11ea-857c-f787a6ab9a5a.gif)

Depth ordering bugs are fixed! And now I face the a similar rendering bug as @filip-halemba reported in #284. Sadly, turning on backface culling on the overlay surface had no effect for me. However, turning on `force_opaque` did work! See changes in this PR.

![fig3](https://user-images.githubusercontent.com/428273/74261535-5086d900-4cf3-11ea-9b58-5d187334052c.gif)

Perfection at last!

EDIT:

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `21e71838328e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.