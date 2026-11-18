# Issue

**Title:** Add SEEG/ECoG electrodes with just 3D figure open

## Description

Does three things:

1. Can set electrodes directly from 3D Viz (without having to open MRI Viewer). This does not remove any the old functionalities rather adds to it.
    - For SEEG > Display sensors in MRI 3D slices > add SEEG IsoSurface to figure (Surface tab) > Add electrode and enable Select tool (iEEG tab) > Select points in 3D IsoSurface and Set tip and Skull entry to create the electrode.
    - The steps work for ECoG as well (Either use [test data](https://drive.google.com/drive/folders/1v6IvXRbxUeawT-jB3VAJinrIzPxVPtMT?usp=sharing) or just use the SEEG IsoSurface above to create dummy ECoG).
    - This gives option to the user to create electrodes directly in 3D without having to open MRI Viewer.
    
2. Commit 17cc586 fixes the issue below (point # 6 in #732)

> Display sensors in MRI 3D slices, add IsoSurface to figure (surface tab), add new SEEG electrode (in IEEG tab), enable Select tool (in EEG tab), click on isosurface. Result: MRI viewer opens (why?), all electrodes disappear of GUI and Electrode configuration is disabled. Electrodes are visible in 3D figure.

3. Commit ef42f61 addresses the point below (point # 5 in #732)

> Printing contact locations in GUI, better text alignment
Discussion: Do we really need to print up to one-hundredth of millimeter?
RESOLUTION OF 0.1 mm IS ENOUGH

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d0aac8311fcb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.