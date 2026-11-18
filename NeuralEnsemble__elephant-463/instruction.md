# Issue

**Title:** Enh/elephant data versioning

## Description

With this PR versioning for elephant-data (currently on: https://gin.g-node.org/INM-6/elephant-data) is introduced.

## Issue
Different files from elephant-data are used in unit-tests and tutorial notebooks. Since the datasets on elephant-data may undergo various changes over time, any change would potentially break the unit tests of old elephant versions.

During development of a new tutorial or unit-test the used files might not yet be merged into elephant-data[master]. This requires the use of hard coded links to the development branch (on gin) until merged.

 ## `download_datasets`: use only paths relative to repo root
Those issues might be addressed by creating releases of the elephant-data repository. Currently all links used in tutorials and unit-tests have to following structure:

**`Link to root of repository`**+_`path starting at root`_
example:
**`'https://web.gin.g-node.org/INM-6/elephant-data/raw/master/'`**+_`'unittest/spectral/multitaper_psd/data/time_series.npy'`_

This PR addresses this issue by introducing a new function `download_datasets` , which contains a default URL (first part in example above) and hence only requires the relative path from repository root as input. This default URL could be set to a specific release of elephant-data, e.g. `'https://web.gin.g-node.org/INM-6/elephant-data/raw/0.0.1'`pointing to release v0.0.1. With every new version of elephant, this could be changed to the corresponding elephant-data version.

**Update**: A first release of elephant-data was created (v0.11.0).  `download_datasets` now uses the currently installed version of elephant to create the URL pointing to a specific elephant-data release. 

## environment variable `ELEPHANT_DATA_URL`
Furthermore an environment variable `ELEPHANT_DATA_URL` is introduced, which allows to specify a different URL to the root of the repository. 

Typical use cases  could be development and CI workflows.
- for CI use the latest state of elephant-data
      - set  `ELEPHANT_DATA_URL` to `'https://web.gin.g-node.org/INM-6/elephant-data/raw/master/'`
- during development use a specific branch (e.g. multitaper) of elephant-data
      - set  `ELEPHANT_DATA_URL` to `'https://web.gin.g-node.org/INM-6/elephant-data/raw/multitaper'`

In both use cases an environment variable is changed and only the relative paths to the repository's root are hard coded. 

TODO:
- [x] create release of elephant-data (https://gin.g-node.org/INM-6/elephant-data)
- [x] set default URL to first release

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7a6d3f257593`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.