# Issue

**Title:** STC additions

## Description

Added 'alt+z2' and 'alt-z2' to tpattern options for slice time correction, as well as the ability to specify the interpolation method used by 3dTshift. It might also be worth considering changing the default from quintic to one of the more recent methods (wsinc or fourier).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6f19f204c984`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.