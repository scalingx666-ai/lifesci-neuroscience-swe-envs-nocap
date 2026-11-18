# Issue

**Title:** Add `grid_spacing` and `origin_coords` to the fields of `ImagingPlane`

## Description

## Motivation

This should fix #1885 

I discussed this with @rly and it seems that it was just an omission.  This PR tries to address this. So far, this seems to work for `grid_spacing` but for some reason that escapes me it seems that `origin_coords` is not added to the fields. 

![image](https://github.com/NeurodataWithoutBorders/pynwb/assets/6429509/5ea3ea40-3cc2-43d0-a49e-c119ae4b9e6f)


```python
from pynwb.testing.mock.ophys import mock_ImagingPlane

imaging_plane = mock_ImagingPlane(grid_spacing=[1.0, 1.0], origin_coords=[0.0, 0.0])
imaging_plane.origin_coords
list(imaging_plane.fields.keys())

```


## Checklist

- [x] Did you update CHANGELOG.md with your changes?
- [x] Have you checked our [Contributing](https://github.com/NeurodataWithoutBorders/pynwb/blob/dev/docs/CONTRIBUTING.rst) document?
- [x] Have you ensured the PR clearly describes the problem and the solution?
- [x] Is your contribution compliant with our coding style? This can be checked running `flake8` from the source directory.
- [x] Have you checked to ensure that there aren't other open [Pull Requests](https://github.com/NeurodataWithoutBorders/pynwb/pulls) for the same change?
- [x] Have you included the relevant issue number using "Fix #XXX" notation where XXX is the issue number? By including "Fix #XXX" you allow GitHub to close issue #XXX when the PR is merged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6cfcf398320b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.