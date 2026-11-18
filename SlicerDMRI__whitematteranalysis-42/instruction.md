# Issue

**Title:** wm quality control after clustering

## Description

The QC looks at all subject directories within the input directory, and for each subject determine which clusters have >1 fiber.

Then across subjects, it can make a histogram just like the groupwise clustering does, to show how many subjects and also a csv file of the same information.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fa10fb3edb80`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.