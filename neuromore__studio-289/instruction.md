# Issue

**Title:** Small Changes

## Description

* Add Warning in Session Control for `ROLE_ClinicClinician` and `ROLE_ClinicOperator`
* Render Folder names centered and line wrapped on the folder icon instead of below it
* Make ChannelSelector output assignment by channel numbers 1 instead of 0 based
* Load default enabled/disabled for OpenBCI and Brainflow drivers from Branding constants

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3f1cf230ed2b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.