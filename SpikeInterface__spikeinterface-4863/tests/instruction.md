# Issue

**Title:** Fix: grid convolution select_peaks

## Description

Another bug in postprocessing (spike locations) which we didn't catch with tests.

The issue is that in #4809 we introduced the possibility to compute locations from `spikes` (no `channel_index`), so we added a way to pass `channel_index_array` externally. When computing spike locations with grid convolution, we have to slice the `channel_index_array` according to the peak selection. This was not caught by tests since the postprocessing dataset has 163 spikes, and default peak selection is 5000!

Extended tests to select 100 peaks for grid convolution.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fd5d42312420`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.