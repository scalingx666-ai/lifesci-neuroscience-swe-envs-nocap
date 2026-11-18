# Issue

**Title:** Improve pair-wise ISI violations computation efficiency

## Description

Hi @Julie-Fabre !
I would like to suggest a small modification to the code used in the computation of pair-wise ISI violations for the Llobet et al. refractory period violations method in `quality_metrics.py`.

The current implementation is extremely slow, due to the nested for loops, as you can see in the attached screenshot (an exemplar single unit of a recording from our lab is considered).

Firstly, I tried a fully vectorized implementation, but the issue with that solution was the saturation of memory, thus I am now proposing a partially vectorized implementation significantly increasing the computation speed.

Hope this helps! :)

<img width="1315" height="1158" alt="image" src="https://github.com/user-attachments/assets/4cecd157-4af6-4100-9f99-3179c21bbe68" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1fdc7a82a2e4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.