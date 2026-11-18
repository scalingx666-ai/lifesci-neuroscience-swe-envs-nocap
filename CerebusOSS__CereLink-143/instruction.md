# Issue

**Title:** CCF version reading - don't use stringview.compare(). Fixes #142

## Description

This modifies how CCFUtilsXml reads the version number from the first element in a CCF file.
I also added a dummy test application to read the CCF. While it seems to be working, and the packets are indeed getting the information they need from the CCF, the send-on-read is not working. That can be investigated in a different effort.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0aedd1d1cc9b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.