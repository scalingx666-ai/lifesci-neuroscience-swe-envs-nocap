# Issue

**Title:** Change map to list comprehension in io_mesh.py for reading MNI .obj files

## Description

To install nighres, I used the docker solution. Inside the container, the Python version is 3.5.2. On Jupyter Notebook (from the container) I tried this:

```python3
from nighres.io import load_mesh_geometry
g = load_mesh_geometry('surface.obj')
```

The resulting error happens:

```python3
---------------------------------------------------------------------------
TypeError                                 Traceback (most recent call last)
<ipython-input-49-6e4dedc38e29> in <module>
      1 from nighres.io import load_mesh_geometry
----> 2 g = load_mesh_geometry('/home/neuro/s/good.obj')

/usr/local/lib/python3.5/dist-packages/nighres/io/io_mesh.py in load_mesh_geometry(surf_mesh)
    131             points, faces = _read_ply(surf_mesh)
    132         elif surf_mesh.endswith('obj'):
--> 133             points, faces = _read_obj(surf_mesh)
    134         else:
    135             raise ValueError('Currently supported file formats are freesurfer '

/usr/local/lib/python3.5/dist-packages/nighres/io/io_mesh.py in _read_obj(file)
    457             XYZ = np.zeros([n_vert, 3])
    458         elif i <= n_vert:
--> 459             XYZ[i - 1] = map(float, line.split())
    460         elif i > 2 * n_vert + 5:
    461             if not line.strip():

TypeError: float() argument must be a string or a number, not 'map'
```

`map()` just can't be used in this fashion. To replicate the bug, you could get a sample surface from [here](https://github.com/CobraLab/atlases/blob/master/colin27-subcortical/surfaces/thalamus-left.obj) or just consider the code snippet below. I've isolated the problematic line in an example, copy and paste this in ipython3

```python
import numpy as np
x = np.zeros([8, 3])
line = '0.1 0.2 0.3'
x[5] = map(float, line.split())
```
```
TypeError: float() argument must be a string or a number, not 'map'
```

### Fix

Using list comprehensions to do array mapping instead works well.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9ced74e61db0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.