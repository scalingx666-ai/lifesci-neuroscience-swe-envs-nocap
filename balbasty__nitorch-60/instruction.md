# Issue

**Title:** chi parameter estimation in mpm greeq

## Description

- pass dof variable from CMM to greeq  _nonlin_gradient(),
- added chi model parameter estimation in greeq _nonlin_gradient(),
- optional parameter and noise estimation with chi model (chi=False argument)

lines 659- in greeq did not work for me for any model, couldn't find offdiag being used anywhere

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ec4d857bfb8e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.