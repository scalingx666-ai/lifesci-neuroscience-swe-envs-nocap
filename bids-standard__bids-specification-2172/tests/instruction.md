# Issue

**Title:** [FIX] Update ResonantFrequency and SpectrometerFrequency to support both string/number and arrays

## Description

Noticed that ResonantFrequency and SpectrometerFrequency required arrays. Should allow either a string or number, respectively, (most common case) or arrays of strings or numbers, respectively.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dbe1cd08c5c7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.