# Issue

**Title:** Pointnet multiple runs

## Description

I've implemented the feature to run multiple PointNet simulations with a single config file.

The specifications and how to use is written in the manual page. The demo is written under the 'point450_glifs' directory. I did not make specific test cases for this feature as I did not find an appropriate section for this. It seems that the reading configs and running NEST simulation seems lacking in the test case (let me know if I'm missing it), and I feel the necessity of it for the future.

Side note: It seems that the dt for PointNet demos (under examples) is set to 0.001 ms. I think this is an overkill and should be changed to 0.1 ms. I took care for point450_glifs, but we need to fix/test other example directories as well. I'll put that as an issue.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b0741a99faa0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.