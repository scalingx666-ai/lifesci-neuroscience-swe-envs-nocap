# Issue

**Title:** Support importing `.ply` mesh files

## Description

This PR aims to support import of `.ply` mesh files into Brainstorm. It is another widely used format for storing mesh data.
Would be particularly useful to test the Auto EEG detection of electrodes from caps from some publicly available data from [SPOT3D](https://www.researchgate.net/publication/335666443_SPOT3D_Spatial_positioning_toolbox_for_head_markers_using_3D_scans) ([Paper](https://www.researchgate.net/publication/330332735_Spatial_localization_of_EEG_electrodes_using_3D_scanning/figures)).

Data uploaded [here](https://drive.google.com/drive/folders/1C8esg94di02a-oaRGc5-TWnJN5jsG-by?usp=drive_link).

This is what it looks like after importing and running Auto EEG detection the `ANT Scan.ply` with `ANT Waveguard 128` template.

https://github.com/user-attachments/assets/816df901-f364-4e70-8762-548d1da0b23c


**PS**: The `in_tess_ply.m` is largely AI generated. Does a pretty good job.

Verified backward compatibility till R2014b.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `98a7501915cc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.