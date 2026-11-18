# Issue

**Title:** Update loc-MEG documentation in meas_info.py

## Description

#### What does this implement/fix?

Documentation improvements: I hope this version clarifies how one should assembly the loc-MEG array for multi-axis OPM.

#### Additional information

I saw some discussion around this topic:
https://mne.discourse.group/t/opm-sensor-direction-set/6926
https://mne.discourse.group/t/why-is-the-rotation-matrix-used-to-represent-the-normal-direction-of-meg-sensor-how-can-i-get-this-matrix/6455

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a43fb22b9090`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.