# Issue

**Title:** Add line actor

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [ ] Bug fix
- [x ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

3D drawing primitives are typically points, lines, and surfaces/volumes. 
While there are simple ways to add points and volumes to a scene in brainrender, there seems to be no straightforward way to add a simple line to a scene. The available options seem to be to import a line via a neuron .swc morphology file, or (potentially) to import a (to me still mysterious) streamlines .json file. 

**What does this PR do?**

This PR implements a simple `Line` actor class and adds it to the `actors` namespace. 

```python
from vedo import shapes
from brainrender.actor import Actor


class Line(Actor):
    def __init__(self, coordinates, color="black", alpha=1, linewidth=2, name=None):
        """
        Creates an actor representing a single line.

        :param coordinates: list, np.ndarray with shape (N, 3) of ap, dv, ml coordinates.
        :param color: str
        :param alpha: float
        :param linewidth: float
        :param name: str
        """

        # Create mesh and Actor
        mesh = shapes.Line(p0=coordinates, lw=linewidth, c=color, alpha=alpha)
        Actor.__init__(self, mesh, name=name, br_class="Line")

```

## References

Could not find any related issues but also didn't peruse the tracker exhaustively. 

## How has this PR been tested?

This script visualizes the (pre-computed) shortest path within cortex boundaries between two cortical neurons. 

![Screenshot from 2024-04-16 15-30-34](https://github.com/brainglobe/brainrender/assets/8046146/363f3f1b-5e44-47c0-8f9d-8898a9424231)


```python 
import numpy as np
import vedo
vedo.settings.default_backend= 'vtk'

from brainrender import Scene
from brainrender.actors import Points, Line

scene = Scene(atlas_name="allen_mouse_25um")
cortex = scene.add_brain_region(688, alpha=0.2, color="green")

p1 = np.array([183, 202, 390]) # ABA voxel coordinates for cell #1
p2 = np.array([171, 111, 244]) # ABA voxel coordiantes for cell #2
coordinates = np.vstack([p1, p2])
coordinates *= 25 # ABA voxel resolution
cells = scene.add(Points(coordinates, name="cells", colors="steelblue", radius=100))

# add path
path = np.array([
    [183,202,390],
    [183,201,389],
    [183,200,388],
    [183,199,387],
    [183,198,386],
    [183,197,385],
    [183,196,384],
    [183,195,383],
    [183,194,382],
    [183,193,381],
    [183,192,380],
    [183,191,379],
    [183,190,378],
    [183,189,377],
    [183,188,376],
    [183,187,375],
    [183,186,374],
    [183,185,373],
    [183,184,372],
    [183,183,371],
    [183,182,370],
    [183,181,369],
    [183,180,368],
    [183,179,367],
    [183,178,366],
    [183,177,365],
    [183,176,364],
    [183,175,363],
    [183,174,362],
    [183,173,361],
    [183,172,360],
    [183,171,359],
    [183,170,358],
    [183,169,357],
    [183,168,356],
    [183,167,355],
    [183,166,354],
    [183,165,353],
    [183,164,352],
    [183,163,351],
    [183,162,350],
    [182,161,349],
    [181,160,348],
    [181,159,347],
    [180,158,346],
    [179,157,345],
    [178,156,344],
    [177,155,343],
    [176,154,342],
    [175,153,341],
    [174,152,340],
    [174,151,339],
    [173,150,338],
    [172,149,337],
    [172,148,336],
    [172,147,335],
    [171,146,334],
    [170,145,333],
    [170,144,332],
    [170,143,331],
    [169,142,330],
    [168,141,329],
    [168,140,328],
    [168,139,327],
    [168,138,326],
    [168,137,325],
    [168,136,324],
    [168,135,323],
    [168,134,322],
    [168,133,321],
    [168,132,320],
    [168,131,319],
    [168,130,318],
    [168,130,317],
    [168,129,316],
    [168,128,315],
    [168,128,314],
    [168,127,313],
    [168,126,312],
    [168,125,311],
    [168,124,310],
    [168,124,309],
    [168,123,308],
    [168,122,307],
    [168,122,306],
    [168,121,305],
    [168,120,304],
    [168,120,303],
    [168,119,302],
    [168,118,301],
    [168,118,300],
    [168,118,299],
    [168,117,298],
    [168,116,297],
    [168,116,296],
    [168,115,295],
    [168,114,294],
    [168,114,293],
    [168,113,292],
    [168,112,291],
    [168,112,290],
    [168,111,289],
    [168,111,288],
    [168,110,287],
    [168,110,286],
    [168,110,285],
    [168,109,284],
    [168,109,283],
    [168,108,282],
    [168,108,281],
    [168,108,280],
    [168,108,279],
    [168,108,278],
    [168,108,277],
    [168,107,276],
    [168,107,275],
    [168,106,274],
    [168,106,273],
    [168,106,272],
    [168,106,271],
    [168,106,270],
    [168,106,269],
    [168,106,268],
    [168,106,267],
    [168,106,266],
    [168,106,265],
    [168,106,264],
    [168,106,263],
    [168,106,262],
    [168,106,261],
    [168,106,260],
    [168,106,259],
    [168,106,258],
    [168,106,257],
    [168,106,256],
    [168,106,255],
    [168,106,254],
    [168,106,253],
    [168,106,252],
    [168,106,251],
    [168,106,250],
    [168,106,249],
    [168,107,248],
    [168,108,247],
    [169,109,246],
    [170,110,245],
    [171,111,244],
])
path *= 25 # ABA voxel resolution

# line = scene.add(Line(path))
line = scene.add(Line(path))
scene.render()

```

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

Yes, but as this is a draft PR, I haven't bothered with updating the documentation, yet. 

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [x] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ffa7ee6eb710`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.