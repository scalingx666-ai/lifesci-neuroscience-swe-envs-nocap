# Issue

**Title:** fix bbox planar intersection

## Description

This PR fixes the no intersection issue when the intersection of 2 bounding boxes is planar and hence have volume 0 resulting in None. This meant that while there are some intersections, these were ignored. Also, the edge case, the intersection is just a point, is accounted for.

code to reproduce the issue on [current main](31b091200d7c3f3d041e762925ff6571d862268a)
```python
import siibra
points = siibra.PointSet(
    [
        [-35.72, -1.87, 35.03],
        [-33.7, -1.87, 36.2],
        [-32.56, -1.87, 34.34],
        [-35.62, -1.87, 35.2],
    ],
    "bigbrain",
)
matched_sections = siibra.features.get(
    points, siibra.features.cellular.CellbodyStainedSection
)
assert len(matched_sections) > 0
voi = points.boundingbox

# this is expected to fetch but fails assuming there is no intersection
patch_1mu = matched_sections[0].fetch(voi=voi, resolution_mm=-1)
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `31b091200d7c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.