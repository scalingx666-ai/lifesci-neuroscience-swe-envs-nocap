# Issue

**Title:** Updated Hyperalignment

## Description

- updated SRM code from brainiak
- made substantial changes to how Brain_Data alignment data are stored.
- updated how Brain_Data.align() method works.
- minor code refactoring.
- Added temporary fix to weird plotting issues with newer version of matplotlib. issue #351

ToDo:
- Finish updating tests.
- decide whether to include FastSRM, it's a little more work than I thought it was going to be.
- Fix minor Smoothing Bug.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `651699e6937f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.