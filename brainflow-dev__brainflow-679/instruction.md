# Issue

**Title:** Add check for os.arch when unpacking MLModel .dlls on WIndows

## Description

@Andrey1994  This change will cleanup the console log for all BrainFlow users who work with Java, including OpenBCI Public GUI and Galea GUI.

Currently, an error is thrown every time the MLModel class is instantiated.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0071b9c50e6b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.