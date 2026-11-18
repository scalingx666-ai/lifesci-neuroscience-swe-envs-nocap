# Issue

**Title:** [BUG] Annotated Plots

## Description

Iterations in annotated plots are currently plotted by by ascending center frequency, rather than descending peak height (i.e. the order of the peak search). Someone emailed confused about this. I've fixed it here.

Before:
![peak_search](https://user-images.githubusercontent.com/34786005/117513553-d15c7100-af46-11eb-88b1-61ff9143148e.png)

After:
![peak_search_fix](https://user-images.githubusercontent.com/34786005/117513575-dae5d900-af46-11eb-8e17-356ac74ee070.png)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c19a41afa963`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.