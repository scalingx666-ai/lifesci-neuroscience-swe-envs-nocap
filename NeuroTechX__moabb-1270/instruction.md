# Issue

**Title:** Fix Hinss2021 sampling rate and trial alignment

## Description

### Fix Hinss2021 sampling rate and trial alignment (#663)

The released EEGLAB files hold 2 s epochs at 250 Hz, but the loader built
the concatenated recording at a hard-coded 500 Hz, halving every time span
and doubling every frequency: each '2 s' trial covered two released epochs.
Each event also sat one sample after its epoch's start, so the last trial of
every session ran past the end and was dropped by MOABB and braindecode.

Read the sampling rate from the files, pad one leading sample so events mark
the first sample of each epoch, and use interval [0, 2 - 1/250] so a trial
is exactly one released epoch. Synthetic regression test included.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9f8ce18040d0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.