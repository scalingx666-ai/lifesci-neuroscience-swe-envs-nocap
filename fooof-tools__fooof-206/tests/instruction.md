# Issue

**Title:** [BUG] - Fix embedded lists for ap_fit guess

## Description

Short version: the fixed line ended up with an extra layer of embedded lists which led to downstream problems. 

The longer version (why it's a problem):
In practice, we never bound the aperiodic fits, but in theory one could, by update `_ap_bounds`. However - if one tried to do this, then the fitting actually gets kicked to a different approach, which then checks that the guess parameters are 1d. This would then fail, because the embedded list made them 2d. This PR fixes that.

Note that this change doesn't change anything that happens in standard usage - but will make it possible to add `_ap_bounds`, in which case what happens in the fitting is slightly different.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f70a12f6f5f8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.