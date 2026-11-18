# Issue

**Title:** Implement analysis class

## Description

Major rework of the analysis package to get rid of load_CR_input_dict load_maps_dict functions, which would save intermediate .pkl files taking unecessary storage (the timeseries were copied into load_CR_input_dict).
Now the main analysis is handled by a core FCAnalysis interface that computes all operation per scan at once when loading the data.
This required major rewiring of the nipype workflows, and changing several intermediate functions.

The saving on storage space is substantial - the bulk of storage at analysis stage is gone. There is also a meaningful speed gain.

All changes were reviewed by me + Claude AI to confirm that no final output change, only internal processes did.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0b3a8fe71d7d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.