# Issue

**Title:** WIP: failing at writing a test for slice timing

## Description

@alexis-roche - I tried to make a test for slice timing in the no-motion
case, by taking some smoothed time series sampled at higher resolution,
and seeing if I could estimate the generated time point corresponding to
the start of the TR, by giving the routine the time points sampled at
times corresponding to the slices.

This seems to work OK for ascending and descending acquisitions, but not
for alternating ascending - or at least - it seems to work quite a bit
worse.  Any ideas what's going on here?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ae23b70f52cd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.