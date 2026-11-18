# Issue

**Title:** C# P/Invoke update

## Description

Using InteropServices to pin the pointers to the managed C# arrays and pass them to cbsdk_native to fetch data in a single copy, implemented for both Int16 and double samples. 

Spoke with @cboulay and removed CLI files to only keep P/invoke version and updated the UnityExample file.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7fba59ca24e5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.