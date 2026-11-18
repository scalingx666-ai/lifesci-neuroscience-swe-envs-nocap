# Issue

**Title:** ENH: write eyetracking data

## Description

Towards #1342 

This strips out the previously written eyetrack writing code from #1512 in order to keep the diff manageable.

FYI this Adds a parameter `eyetrack_calibration` to `write_raw_bids`, which must be passed when the Raw data include eyetrack channels, as BIDS wants metadata about the experimental display that can't be automatically inferred.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `00d02f1c6a41`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.