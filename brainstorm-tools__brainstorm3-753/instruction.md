# Issue

**Title:** iEEG: Different ways to start `SEEG/ECOG Implantation`

## Description

This PR refactors the **SEEG/ECOG Implantation** option:

1. Users can **right click on a CT or MRI** individually and start implantation. Only show MRI Viewer and load iEEG panel.

2. Users can now **right click on the Subject** both in **Anatomy** and **Functional** modes, and use the GUI above to decide on what modalities they want to proceed with. 
![Screenshot 2024-11-19 125245](https://github.com/user-attachments/assets/810a7a15-c74d-4865-aeae-cf061616a9f2)
-  `MRI`: Start implantation on the default MRI. Only show MRI Viewer and load iEEG panel. This is similar **to right click on a MRI and start implantation**.
- `CT`: Start implantation on the CT. If multiple CTs then UI pops up for users to choose. Only show MRI Viewer and load iEEG panel. This is similar **to right click on a CT and start implantation**.
- `MRI+CT`: Start implantation with CT overlayed on default MRI. If multiple CTs then UI pops up for users to choose. Only show MRI Viewer and load iEEG panel.
- `MRI+CT+Isosurface`: Start implantation with CT overlayed on default MRI. Since there can be only one isosurface per subject as of now, based on which CT file the isosurface was generated from, it loads that CT. If the associated CT is not found then UI pops up for users to choose. Show MRI Viewer, show 3D fig and load iEEG panel.

Special case (@rcassani correct me here if I am wrong):
- `CT+Isosurface`: This is a case when users would just import raw CTs and start their implantation without having an MRI. Results will be same as `MRI+CT+Isosurface` case just that MRI viewer will just have CT and 3D fig will have the isosurface+CT3D.

Relevant forum topics:
- https://neuroimage.usc.edu/forums/t/electrode-location-using-brianstrom-of-verison-25-oct-2024/48747/10

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `74ee4e43b1cd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.