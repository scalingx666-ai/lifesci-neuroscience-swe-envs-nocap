# Issue

**Title:** HBP-189 Fix tests in tvb-contrib related to cosimulation

## Description

I made corrections to CoSimulator tests in contrib, which were failing because the default connectivity had 0 delays without 0 weights for self connections.

I added a function to correct tract_lengths given a choice for synchronization time and connectivity speed, such as that all connections have a delay at leats equal to the synchronization time.

There were still some tests failing in the cases of bad cosimulation input or of lack of cosimulation input, when testing differences for every single time point. Actually, they were failing only for the first two time points.

I am not sure why. Therefore, I corrected them for the moment by testing for total sum of the differences across the whole simulation. @lionelkusch could probably help with this. They are marked tih TODOs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fe180c00fb8b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.