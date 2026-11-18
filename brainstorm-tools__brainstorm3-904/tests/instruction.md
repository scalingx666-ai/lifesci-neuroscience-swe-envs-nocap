# Issue

**Title:** Bugfix `Digitize panel 2024`: `Digitize.iPoint` should point to end of list

## Description

After automatically getting all the EEG points, the `Digitize.iPoint` should point to end of list.

Introduced in 

**Steps to reproduce:**
This was particularly observed when collecting `Random` points for the `WearableSensing DSI-24` EEG headset **(only in the 2024 panel)**.
1. Get all the EEG electrodes by running `Auto` (3D model available in the [tutorial](https://neuroimage.usc.edu/brainstorm/Tutorials/TutDigitize3dScanner#Example_dataset) dataset).
2. Click `File -> Save in database and exit`. The channel file shows the correct (22) electrodes.
3. Repeat step-1.
4. Click on `Random` to collect the 150 headshape points. 
5. Click `File -> Save in database and exit`. Channel file just shows 3 electrodes.
<img width="500" height="90" alt="Screenshot 2026-03-24 150159" src="https://github.com/user-attachments/assets/75e8de36-5cbd-4669-be24-933c1020f461" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `98a7501915cc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.