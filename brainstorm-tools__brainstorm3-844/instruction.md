# Issue

**Title:** [IO] Export fiducials

## Description

This adds the option to export fiducials from an MRI. This will be useful for the BIDS export. 

I am adding it to a separate PR so it's easier (faster?) to review. Note that this doesn't quite work. It works if I don't convert the coordinate to voxel, but with the conversion, it doesn't. 


What's strange is that the coordinate in the JSON file doesn't match what is in the MRI after importation..

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `30993d8077ad`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.