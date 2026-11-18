# Issue

**Title:** Fix corrupted raw nrrd file output on Windows

## Description

On Windows, when NRRD file was written into .nrrd format with raw pixels then the image was corrupted.

The root cause was that the file was opened in text mode and therefore each 0a byte was converted to 0d0a resulting in an incorrect byte stream.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aea081a97ba8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.