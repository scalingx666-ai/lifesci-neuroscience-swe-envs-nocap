# Issue

**Title:** Making physical spacing optional for drifting gratings + faster separable FilterNet

## Description

The physical spacing of the drifting gratings became an option that can be written in the config file.
(previously, it was fixed at 1/(cpd*10))

This changes the resulting visual responses ~10% because the default value was not sufficient for encoding spatial kernel.
Future FilterNet run should specify this value as needed. (1.0 is a good ballpark if the smallest spatial kernel size is ~2 degrees.)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4eaa6093c100`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.