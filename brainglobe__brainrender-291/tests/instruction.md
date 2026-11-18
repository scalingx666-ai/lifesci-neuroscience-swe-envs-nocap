# Issue

**Title:** various (small) improvements

## Description

## Description

**What is this PR**
- **camera.py** and **cameras.py**: rename old 'clippingRange' -> 'clipping_range' rename old 'focalPoint' -> 'focal_point'
- **render.py**: remove import `matplotlib.pyplot as plt`, this looks like a genuine bug 
- correct `close()` method accordingly
- add `actor._mesh.transform = None` in `if isinstance(actor._mesh, VedoVolume)` as future vedo release will need this
- **settings.py**: set `WHOLE_SCREEN = False` as default, avoid setting `size='full'` as this is poorly dealt with in vtk
- fix output path in `examples/screenshot.py` and `video.py`
- **pyproject.toml**: a newer version of "morphapi>=0.2" seems to be needed


## How has this PR been tested?

Tested on the examples

## Is this a breaking change?
No


## Does this PR require an update to the documentation?
No

## Checklist:

- [ ] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `19350ce6b895`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.