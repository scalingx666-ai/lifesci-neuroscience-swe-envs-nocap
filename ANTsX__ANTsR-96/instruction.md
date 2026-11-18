# Issue

**Title:** Added basic RFT functions

## Description

This contains some new functions for performing an RFT analysis:
- euler: calculates euler characteristic
- rftResults: given certain parameters calculates set, cluster, and peak level statistics
- rftPval: basic formula that is utilized for RFT p-values
- statFieldThresh: various methods of thresholding a statistical field
- resels: estimates resolution elements
- estSmooth: estimates the FWHM

I have included documentation for each but I haven't roxygenised them.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fbe5172e6b15`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.