# Issue

**Title:** BF: Remove redundant parsing of comma decimals in importConditions

## Description

As pointed out in #7337, the preceeding code already handles comma decimals (by supplying `decimal=","` to pandas), and this older code where we manually handle comma decimals causes problems with sliders that have only 2 values.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8c7e1293ad37`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.