# Issue

**Title:** fix reloading if "incorrect file, choose another?"

## Description

I think that  parent does not have load_dialog, it is actually `load_dialog(parent)` same as in here:
https://github.com/MouseLand/suite2p/blob/17501ef3d4f03ec4c6ca89d3b9186078a640c4f6/suite2p/gui/menus.py#L19

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a65287423de6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.