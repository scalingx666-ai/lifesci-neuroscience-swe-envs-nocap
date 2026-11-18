# Issue

**Title:** Add cat12

## Description

I added a template for CAT12. I tried to replicate the SPM12 template first, but I realised that hardcoding the Matlab environment in the CAT12 is not so good as the version might change in the future and it currently prevents the SPM12 template from being updated. If you like the approach of keeping the MCR out to reduce code duplication then we could also adjust the SPM12 template. It's probably not possible to combine different templates (e.g. insert the MCR template in the CAT12?)

I also had to adjust a few things in the MCR script to make the GUIs work in neurodesk - I hope that's ok.

I also tried to add documentation - I hope it's clear and helpful :)

This pull request also fixes the bug in

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `78ed3ce7e797`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.