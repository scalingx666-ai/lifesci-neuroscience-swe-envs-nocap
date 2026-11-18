# Issue

**Title:** Major change to Singularity def to address #214

## Description

This is a major change to the Singularity def file to address #214 

- uses Debian Bookworm Slim (current LTS)
- no longer uses Docker embedded in the Singularity
- uses Miniconda rather than the Debian-provided Python 3 plus temurin-openjdk-8

Deficiencies:

- does not include the `docker/jupyter_notebook_config.py` which seems to be specific to neurodocker
  - use in Jupyter notebook not tested

Build by:

``` console
$ apptainer build NighresSingularity.sif NighresSingularity.def
```

Light testing using https://nighres.readthedocs.io/en/latest/auto_examples/example_05_vascular_reconstruction.html

Ran the example script by:

``` console
$ NighresSingularity.sif python example_05_vascular_reconstruction.py
```

which produced a lot of output, and the attached `segmentation.png`:

<img width="2800" height="500" alt="segmentation" src="https://github.com/user-attachments/assets/5b11ebb7-479b-4456-8827-f8ab4735b337" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e572626c96f7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.