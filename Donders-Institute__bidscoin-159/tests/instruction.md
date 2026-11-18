# Issue

**Title:** Catch possible ValueError if run is not specified by user

## Description

Hey there!

I found this ValueError while running v 3.7.3, but I'm not sure it's fixed in v 3.7.4 - unless when users don't specify a run in the bidsmap.yaml, the run value is automatically provided as `NaN` or `0`.

Don't know if it helps, but I hope so!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d1017774d3d9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.