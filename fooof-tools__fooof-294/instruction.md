# Issue

**Title:** Create setters/getters for check modes and fix management

## Description

This fix adds setters and getters for run_modes in fooof objects in fit.py. The dictionary returned by get_description() in info.py includes attributes for all run_modes. The get_fooof() and get_group() functions in group.py are now updated to probably transfer run mode settings from the current object to newly instantiated objects. Documentation relating to run_modes was updated in all files.

This Pull Request relates to this .

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `825c4a48df34`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.