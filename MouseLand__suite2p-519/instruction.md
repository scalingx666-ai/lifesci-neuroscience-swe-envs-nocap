# Issue

**Title:** Test utils refactor

## Description

This pull request mainly simplifies some of the utility functions in the regression testing framework.  As part of this simplification, some useful file handling code and assumptions about underlying file format that was in the utils were moved to io.BinaryFile:

  - BinaryFile.data: a property that returns a 3D numpy array.   Can be called repeatedly without affecting the order of read() operations.

   - BinaryFile.convert_numpy_to_suite2p_binary(): a function that loads a numpy array from disk and then saves it as a binary file.  It's done throughout the testing, but doesn't call any of BinaryFile's code, which can lead to issues if the file format ever changes.  Putting it with the BinaryFile class makes these assumptions clear and simple to debug in the future without needing to modify tests.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6f276f2afcb7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.