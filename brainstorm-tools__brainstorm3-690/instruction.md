# Issue

**Title:** [IO] Reading EDF using FieldTrip to uniform different sampling rates

## Description

Hello, 

The main point of this PR is to use fieldtrip to open edf containing multiple frequencies as the reader of edf is automatically resampling signals with different frequencies. 

it's a bit hacky but it seems to be working and it might be easier than rewritting our current edf reader to account for different frequencies   


Edouard


Edit: performance can be nicely improved by not saving the .mat file and giving directly the data structure to in_data_fieldtrip.  I will do that If you think the rest of the PR is ok :)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5faabfd6734c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.