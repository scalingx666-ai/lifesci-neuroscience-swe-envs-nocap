# Issue

**Title:** Fix GUI fiducial selection on head surface

## Description

Minor fix that allows to use the GUI to click the fiducials on the extracted head surface.

You can do that by running the code:
cfg = [];
cfg.method = 'interactive';
cfg.viewmode = 'surface';
[realign] = ft_volumerealign(cfg, mri)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8584bc5ea9a1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.