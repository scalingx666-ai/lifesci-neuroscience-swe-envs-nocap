# Issue

**Title:** Add support for MRI BESA volumes and surfaces

## Description

This PR adds supports for MRI BESA volumes and surfaces

- Volumes and surfaces can be imported as anatomy folder:
  - Manual: Import original MRI and surfaces
  - Auto: Besides the task in Manual, MNI normalization and 15k-vertex surfaces are computed
  
- Volumes and surface files can be imported independently

![image](https://github.com/user-attachments/assets/870cea65-df7e-4ff0-8a8d-32b88d058f88) ![fig3d_scalp_wm](https://github.com/user-attachments/assets/a324284b-501d-4cb2-8ff9-0202ec69d62f)
![image](https://github.com/user-attachments/assets/90419c05-d514-42db-b4a0-7e6fed9ff20b)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3d24eed297e4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.