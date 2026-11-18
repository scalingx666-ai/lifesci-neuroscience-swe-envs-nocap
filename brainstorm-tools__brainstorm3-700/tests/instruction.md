# Issue

**Title:** [panel ieeg bugfix] For backward compatibility with old tutorials

## Description

**Issues with [Epileptogenicity](https://neuroimage.usc.edu/brainstorm/Tutorials/Epileptogenicity) tutorial:**
1. In sections [SEEG timeseries](https://neuroimage.usc.edu/brainstorm/Tutorials/Epileptogenicity#SEEG_time_series) and [2D topography](https://neuroimage.usc.edu/brainstorm/Tutorials/Epileptogenicity#A2D_topography), viewing 2D Electrodes and 3D electrodes raises an error. 
![Screenshot 2024-04-23 155838](https://github.com/brainstorm-tools/brainstorm3/assets/21283733/a5cbb2c1-4d1c-4db0-90e1-f19a3458178b)
Reason: `GetElectrodes()` in `panel_ieeg` looks for MRI Viewer for getting the electrode details but is not able to find.
**Fix:**   

**Issues with [ECoG](https://neuroimage.usc.edu/brainstorm/Tutorials/ECoG) tutorial:**
1. Same issues, reason and fix as 1. above for section [2D/3D topography](https://neuroimage.usc.edu/brainstorm/Tutorials/ECoG#A2D.2F3D_topography)

**General issues**
1. Closing MRI Viewer closes all other figures using the [X] button on the top> Reported [here](https://neuroimage.usc.edu/forums/t/ieeg-panel-bugs/45884/12) as well.
**Fix:**

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a462f2910a27`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.