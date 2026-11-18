# Issue

**Title:** removed ambiguous behavior of nearest

## Description

the fieldtrip utility function nearest at some point was changed to support a 2-element vector as second input. This may have had its historical reasons, but led to ambiguous behavior, in the sense that the vector was treated as a range, within which the nearest indices should lie. This led to unexpected behavior. 

I did a sweep of the codebase - to identify potential locations where a 2-element input was used, and cleaned this up. I reverted the functional behavior of nearest back to supporting only a scalar second input argument. I think that I picked up most of the relevant code, and rely on the dashboard to catch any trailing occurrences.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `82daca120927`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.