# Issue

**Title:** Improved support for FieldLine OPM data

## Description

Overcomes some of the issues with using the base `.fif` import tools from FieldTrip.

Currently doesn't incorporate importing fiducials yet. This is more of a "how to organise `spm_opm_create`" issue, as they are can be imported using `ft_read_headshape` easily enough at the moment.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9c6c52775101`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.