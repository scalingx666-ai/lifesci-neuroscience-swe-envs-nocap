# Issue

**Title:** [MNT] - Fix order of reporting values in bw limits warning

## Description

It turns out in our bandwidth limits warning, the variables were flipped such that it printed out wrong. 

For example, with a frequency resolution of 1, and a bandwidth limit of 0.5, the current code would print:
`FOOOF WARNING: Lower-bound peak width limit is < or ~= the frequency resolution: 1.00 <= 0.50`

Which is unhelpfully wrong... 

This PR fixes this, by switching the variables to report properly. From my checks, I think it is just the warning that prints out wrong - the actual checks of the values seem correct.

This responds to this issue as reported in #244

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `12e085defe30`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.