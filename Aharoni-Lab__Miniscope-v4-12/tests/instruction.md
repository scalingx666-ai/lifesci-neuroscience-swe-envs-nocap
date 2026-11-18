# Issue

**Title:** Dual LED board updates

## Description

Changes:

- Removed the 3k3 pull up resistors and changed their values to DNL

- Added the correct values to the voltage divider 

To do

- Move the center of the LEDs to the center of the machined part. Currently the center is off by 2 mm

- Remove the pull up resistors from the release board

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `51da0e98c961`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.