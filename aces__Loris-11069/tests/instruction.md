# Issue

**Title:** [instrument_list] Fix minor multilingual bugs

## Description

## Brief summary of changes

This PR expands the abbreviation CQ in the French translations, as it is not a widely recognized acronym. It also fixes the previously overwritten translations for BVL QC Status and BVL QC Type, which occurred during the initial localization of the module, and corrects a minor typo in the French translation.

#### Testing instructions (if applicable)

After logging in, navigate to the following URL /instrument_list/?candID=587630&sessionID=1053&lang=en-CA and switch the interface language to French.

1. Please refer to the images present in the corresponding issue.

#### Link(s) to related issue(s)

*  (Reference the issue this fixes, if any.)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4e076bc38ec5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.