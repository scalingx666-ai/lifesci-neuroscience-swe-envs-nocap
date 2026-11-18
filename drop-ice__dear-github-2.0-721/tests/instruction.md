# Issue

**Title:** Improve alphabetical checking

## Description

Saw a few cases where lexicographic comparison was creating false negatives for the alphabetical check. Still doesn't cover all cases (e.g. ) but it should fix a few cases where someone's last name is lowercase.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `de514e144fc7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.