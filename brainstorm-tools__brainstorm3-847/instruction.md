# Issue

**Title:** [edf import] Improve fieldtrip edf reader

## Description

Hello, 

This PR is here to improve the fieldtrip EDF reader: 

- Restore the progress bar after installing fieldtrip:  Currently, If you try to load a file while FieldTrip is not installed, the progress bar is wrong after the installation and stays as 'installing FieldTrip' during the file loading.  [ handled in  ]

- Avoid the creation of a temporary file.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8ef9428546f9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.