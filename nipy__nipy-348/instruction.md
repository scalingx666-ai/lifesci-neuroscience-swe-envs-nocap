# Issue

**Title:** MRG: fix intermittent errors from Formula

## Description

Closes gh-258.

Intermittent errors testing Formula, turned out to be from:
- An error I introduced trying to make it easier to use sub-classes with
  Formula add and subtract;
- Unpredictable order of terms after subtraction, caused by use of set to find
  unique terms.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `402877d0d0ee`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.