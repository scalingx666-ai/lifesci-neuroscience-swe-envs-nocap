# Issue

**Title:** Update the brainglobe V3 mesh directory

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
 

**What does this PR do?**
- Packages and stores the meshes in nm, with the inverted axes (x, y, z) vs (z, y, x).
- Adds the annotations to the precomputed directory and stores all necessary metadata during packaging
- Updates the core BrainGlobeAtlas class to fetch and cache the meshes in the correct directory

## References
 

## How has this PR been tested?
- Tested locally by packaging an atlas and comparing the mesh to the existing `.obj` files stored in the current atlases
- Updated the files in `s3://brainglobe/atlas-rc2/annotation-sets/*/*/annotations.precomputed` to update the stored fiels
- Neuroglancer is able to parse this data and load both the [annotations and the meshes](https://neuroglancer-demo.appspot.com/#!%7B%22dimensions%22:%7B%22z%22:%5B0.00001%2C%22m%22%5D%2C%22y%22:%5B0.00001%2C%22m%22%5D%2C%22x%22:%5B0.00001%2C%22m%22%5D%7D%2C%22position%22:%5B660%2C345.7674865722656%2C491.8180847167969%5D%2C%22crossSectionScale%22:2.6685135817747954%2C%22projectionScale%22:2048%2C%22layers%22:%5B%7B%22type%22:%22image%22%2C%22source%22:%22s3://brainglobe/atlas-rc2/templates/allen-adult-mouse-stpt-template/2015/template.ome.zarr/%7Czarr3:%22%2C%22tab%22:%22rendering%22%2C%22shaderControls%22:%7B%22normalized%22:%7B%22range%22:%5B0%2C516%5D%2C%22window%22:%5B0%2C646%5D%7D%7D%2C%22name%22:%22template.ome.zarr%22%7D%2C%7B%22type%22:%22segmentation%22%2C%22source%22:%22s3://brainglobe/atlas-rc2/annotation-sets/allen_mouse-annotation/3_0/annotations.precomputed/%7Cneuroglancer-precomputed:%22%2C%22tab%22:%22source%22%2C%22segments%22:%5B%5D%2C%22name%22:%22annotations.precomputed%22%7D%5D%2C%22selectedLayer%22:%7B%22visible%22:true%2C%22layer%22:%22annotations.precomputed%22%7D%2C%22layout%22:%224panel-alt%22%7D)
- All current tests pass

## Is this a breaking change?
Only to the currently unreleased version in main. Existing `.brainglobe/brainglobe-atlasapi` directories will need to be deleted. 

## Does this PR require an update to the documentation?
Yes, will come in developer and packaging docs in the future.

## Checklist:

- [x] The code has been tested locally
- [x] Tests have been added to cover all new functionality (unit & integration)
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `deb921e2c583`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.