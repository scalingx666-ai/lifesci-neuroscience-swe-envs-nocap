# Issue

**Title:** neuronapi: nrn_get_plotshape_interface casts through the object's class

## Description

With a GUI, `PlotShape` makes a `ShapePlot`, whose `ShapePlotInterface` is its second base (`class ShapePlot: public ShapeScene, public ShapePlotInterface`, `shapeplt.h`). `nrn_get_plotshape_interface` cast the object's `void*` straight to `ShapePlotInterface*`, so with a GUI it returned the wrong address and the first virtual call on it crashed. Without a GUI the object is a `ShapePlotData`, whose only base is the interface, so the cast happened to be right.

It now casts through the class the object was made as, the same way `nrnpy_hoc.cpp` does and on the same condition `sh_cons` uses (`HAVE_IV` and `hoc_usegui`). This is what makes `test/rxd/test_pltvar.py` segfault in the Coverage job on #3877, which runs with InterViews and Xvfb.

`test/api/plotshape_interface.cpp` checks the variable name, `low`, `high` and the section list of a `PlotShape(0)` and a `PlotShape(sl, 0)`. It doesn't pass `-nogui`, so it gets a `ShapePlot` when there is a display: on master under Xvfb it segfaults, with the fix it passes, and without a display it passes either way. So in CI it only guards the fix in the Coverage job. On Windows it passes `-nogui`, because there NEURON starts the GUI without checking for a display.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ef8f20d1f578`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.