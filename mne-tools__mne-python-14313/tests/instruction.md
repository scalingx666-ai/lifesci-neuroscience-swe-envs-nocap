# Issue

**Title:** Add `set_head_sphere` method to store head outline in info

## Description

Adds `MontageMixin.set_head_sphere(sphere=None)` so that object such as `Raw`, `Epochs`, `Evoked` and `Info` all have this method. The method can be used to set the head sphere for topomaps once and then have it be used as the default head sphere every time a topomap-like figure is created.

No AI was used.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0311e444b045`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.