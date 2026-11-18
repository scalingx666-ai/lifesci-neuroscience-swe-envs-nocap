# Issue

**Title:** Pyedflib fix

## Description

# Overview

Upgraded pyedflib to fix build failures. I attempted replicating the issue locally, but could not (python 3.7 & 3.8; BigSur). @lawhead was able to do so. There were no changes in ubuntu or mac arch between build failures. I attempted changing the install order to avoid a seeming issue with numpy (error: `numpy.ndarray size changed, may indicate binary incompatibility. Expected 96 from C header, got 88 from PyOb`). The only change found between builds was in installation steps. However, the requested libraries and versions were installed at the end of this stage. It's possible a dependency declares a different version or allows the latest, and this may result in unexpected behavior? I could not reason other causes.. further exploration may be warranted especially if we run into another failure like this. 

## Ticket

[pivotal ticket
](https://www.pivotaltracker.com/story/show/180816612)

## Contributions

- `requirements.txt`: upgraded pyedflib to latest
- `convert.py`: based on a warning, updated sample_rate to sample_frequency 

## Test

- `make test-all`
- ensure all builds in Github are succesful
- ensure edf is readable and triggers come through 

## Documentation

- Are documentation updates required? In-line, README, or [documentation](https://github.com/BciPy/bcipy.github.io)? N/A

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2a50c7e3a76f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.