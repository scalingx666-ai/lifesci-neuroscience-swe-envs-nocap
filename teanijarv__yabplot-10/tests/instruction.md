# Issue

**Title:** fix: improve side filtering to match tokens rather than substrings

## Description

I stumbled on a small issue with side filtering when plotting commissural bundles: when the bundle filename contained `r_` or `l_`, it was incorrectly assigned to a hemisphere, whereas it should appear in both. See below for an example where the filename was `CC_Fr_1.trk`:
<img width="1483" height="422" alt="image" src="https://github.com/user-attachments/assets/52621f65-dfe7-4f20-9561-801b40a1850c" />

I simply changed how side filtering was performed: tokenize the filename, then match side patterns. It now does not catch trailing substrings (e.g., `r_` or `l_`):
<img width="1483" height="422" alt="image" src="https://github.com/user-attachments/assets/2cdeace5-50f0-4edd-88be-7ff0340f8885" />

The filtering steps also still work for truly lateralized bundles (assuming either `left`, `right`, `l`, `r`, `lh`, or `rh` is in the filename).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ae58ae108427`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.