# Issue

**Title:** ENH: added 'hsvs' option to 5ttgen + mrtransform fix

## Description

- added Hybrid Surface and Volume Segmentation ('hsvs') option to the 5TT image generation class
- removed the in_file existing requirement (exists=True -> exists=False) for 5ttgen because hsvs requires a directory not a file as input
- changed '-inverse' parameter location from 1 to 2 in mrtransform class (to make it possible to insert it in the command together with other parameters)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `42302ed75ce6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.