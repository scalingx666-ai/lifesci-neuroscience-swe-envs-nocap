# Issue

**Title:** feat: keep device timestamps precise in CSV and BDF output

## Description

- Batch CSV conversion uses each packet's own timestamp instead of evenly spaced timestamps per batch
- BDF TimeStamp range starts at the first timestamp and covers 48 h, instead of a fixed 0 to 6 h range that clipped
- Add a TimeStampFine channel to BDF files to store the remainder
- Drop TimeStamp and TimeStampFine channels in EEGLAB export

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b94156fc542e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.