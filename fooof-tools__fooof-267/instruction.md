# Issue

**Title:** [MNT] - Update reports (add settings)

## Description

Responds to #218 

Main updates:
- adds settings to a saved out FOOOFGroup report
- adds the option to choose whether settings are saved for saving out both FOOOF and FOOOFGroup reports
- tweaks some sizing to make the reports work / look good
- adds the option to pass in explicit figure sizes for model plots

Note: for review, the code changes here are fairly simple - but it would be useful to check that when running the report generation code locally, that the sizing and layout looks alright!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `12e085defe30`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.