# Issue

**Title:** Reduce memory footprint of `dss_line`

## Description

Here the promised PR. I don't have a good estimate of the saved memory (as it never worked with the original code) but the gain is at least 50% (reduced from far more than 24gb to 15gb at the max

In a nutshell:
- avoid creating variables if their value can easily be recomputed
- add a keyword to demean that allows to recentre the input variable directly (instead of returning a new variable)
- don't save the `fft` results, but feed it directly into `ifft`

Generally, my motivation was quite selfish. I wanted to make the algorithm work for my data. So, while I obviously tried to not break anything, there is a chance that for other data things might not work anymore. Particularly, the edit in `matrix.py` I suggested, because I simply don't understand why the code was what was. The new version works for my purposes, but perhaps not for others.

If the PR is of any use to you, I can try to add a few tests.

Overall, the results looks really nice, I think:
![image](https://user-images.githubusercontent.com/8819465/144442385-63346f95-9aa9-4250-92e5-b59b89901881.png)

ps. I am not the most versatile github user, so sorry that this is a separate PR and not an upgrade to #57 (if this was desirable)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c4c451b07786`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.