# Issue

**Title:** ENH: Plot with vertex normals

## Description

Makes the surfaces much smoother. Although the effect is more striking when zoomed in, it can even be seen zoomed-out when comparing old and new:
OLD:
![old](https://f.cloud.github.com/assets/2365790/1917480/99bb5b4e-7d99-11e3-9f95-f34757fa4170.png)

NEW:
![new](https://f.cloud.github.com/assets/2365790/1917481/a10c71c6-7d99-11e3-979f-f585ac03605e.png)

I used the optimized code from mne-python to do the normal calculations.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3bb7827377b2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.