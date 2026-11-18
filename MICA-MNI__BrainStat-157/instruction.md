# Issue

**Title:** [DOC, ENH] MPC context decoding

## Description

This PR adds MPC context decoding to the toolbox for both Python and MATLAB. The tutorial currently only exists for Python and is a bit bare bones, but given the OHBM time pressure I suggest we merge this now and clean things up later. .

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e6f0379b8064`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.