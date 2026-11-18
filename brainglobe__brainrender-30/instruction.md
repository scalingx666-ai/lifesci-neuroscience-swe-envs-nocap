# Issue

**Title:** cleanup

## Description

Hi Federico, I could not really fix the main issue of the mesh rotations unfortunately, it is not very clear to me where is this originating..
I used the spyder analyzer to check if there might be some evident issues (i found 2 possible unrelated ones), and tried some very naive tests in vtkplotter yet i could not reproduce it :
```python
from vtkplotter import Plotter, load, datadir

PRT = load(datadir+'pumpkin.vtk')
SCm = load(datadir+'bunny.obj')
SCs = load(datadir+'beethoven.ply')

regions = [PRT, SCm, SCs]
for region in regions:
    scene = Plotter(size='full')
    scene.add(region)
    scene.show()
```
(the above gives the expected output).

So this PR is basically only to cleanup unused imports and spot a couple of undefined variables....

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6701ee14a655`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.