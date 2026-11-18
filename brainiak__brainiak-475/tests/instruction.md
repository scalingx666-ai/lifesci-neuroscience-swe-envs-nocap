# Issue

**Title:** Fix pairwise bootstrap to tolerate NaNs

## Description

This is intended to fix issue #472 raised by @Yibeichan (thanks!). We had some redundant `assert` statements for checking that `squareform` correctly returns a square/symmetric pairwise ISC matrix; however, one of the assertions gets intentionally violated when the ISC inputs contained NaNs. Here we remove the superfluous `assert` statements, which fixes the issue with NaNs; and also use `force='tomatrix'` in the `squareform` call to make the desired output more obvious.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0830090c501d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.