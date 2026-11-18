# Issue

**Title:** [fix] type hint and default for cmaps in plot.slices

## Description

Fix error in `ne.plot.slices` and `ne.plot.volume3D` when `cmaps` are not specified:

```
TypeError: object of type '_GenericAlias' has no len()
...
  File "...", line 246, in volume3D
    return ne.py.plot.volume3D(
           ^^^^^^^^^^^^^^^^^^^^
  File "/autofs/cluster/dalcalab2/users/hew19/interseg3d/work/neurite/neurite/py/plot.py", line 246, in volume3D
    return slices(slics, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^
  File "/autofs/cluster/dalcalab2/users/hew19/interseg3d/work/neurite/neurite/py/plot.py", line 126, in slices
    cmaps = input_check(cmaps, nb_plots, 'cmaps', default='gray')
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/autofs/cluster/dalcalab2/users/hew19/interseg3d/work/neurite/neurite/py/plot.py", line 117, in input_check
    assert (inputs is None) or (len(inputs) == nb_plots) or (len(inputs) == 1), \
                                ^^^^^^^^^^^
TypeError: object of type '_GenericAlias' has no len()
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `35955c058b3c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.