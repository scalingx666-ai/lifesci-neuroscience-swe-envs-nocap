# Issue

**Title:** Allow ai analysis of large repositories

## Description

Use a certain category of files to answer each question. If there are too many or too large files i the relevant category then split the file list to batches, generate answer for each, and then generate a summary of the answers.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b025cb787bd3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.