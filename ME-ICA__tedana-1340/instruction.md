# Issue

**Title:** fixing a pandas string to bool issue

## Description

@marlyr was running tedana with the newest version of pandas and tedana crashed. We think the issue arises in https://pandas.pydata.org/docs/whatsnew/v3.0.0.html due to `The str dtype can only hold strings (or missing values), in contrast to object dtype. (setitem with non string fails)`

Changes proposed in this pull request:

- We identified one place in the code where we copied a pandas series will `str` values and then overwrote the values as `bool`. There was no reason to do this. This PR creates a numpy bool array and then assigns new values there.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d0af9abccd2c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.