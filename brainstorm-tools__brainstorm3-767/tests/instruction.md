# Issue

**Title:** Add `IsoSurface` option for `Add Surface`

## Description

If a subject does not have any other surface but just an isoSurface. User double clicks on SEEG channel and it opens the 3D MRI viewer with the SEEG electrodes. To check for alignment of the electrodes, user wants to overlay the 3D Isosurface on it.

Click on ![iconSurfaceAdd](https://github.com/user-attachments/assets/eaa7530b-435e-4416-a546-72c0b05e22b1) from panel_surface > shows message that is no additional surface available.
![Screenshot 2025-03-18 122649](https://github.com/user-attachments/assets/0de229b2-ddd3-4ab7-8dd0-fa38cc49d00d)


The proposed solution adds an **IsoSurface** option to the menu if it is present:
![Screenshot 2025-03-18 121815](https://github.com/user-attachments/assets/b646a3ea-0e24-4840-afc9-408445b56a7a)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c113225a8136`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.