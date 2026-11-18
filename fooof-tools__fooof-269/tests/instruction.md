# Issue

**Title:** [MNT] - Add `check_freqs` to check for uneven frequency samples

## Description

This adds an explicit check when data added that the frequency vector is evenly spaced (equidistant points in linear space). The goal is to check and exclude situations in which there are gaps in frequencies (which could interact weirdly with things like the peak fitting). 

Note that this check can be turned off by setting the `_check_freqs` private attribute to False


Note: Related to #237, which brought up how unevenly spaced frequency values can lead to failures down the line.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `208fc093f580`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.