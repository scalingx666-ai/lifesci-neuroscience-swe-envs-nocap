# Issue

**Title:** Fix and speed up to_reordered_spike_vector

## Description

Follows #4606 and #4683. Implements part of #4502. @alejoe91 @samuelgarcia 

1. Fixes the always true `elif ("sample_index", "unit_index", "segment_index"):` in `to_reordered_spike_vector`. 
2. Restricts `to_reordered_spike_vector` to non-vanilla orderings, and fixes some inaccuracies in the docstring. 
3. Optimizes `to_reordered_spike_vector`. There is a numba path with a counting sort that drops the time on an ~400M spike / 342 unit / 1 segment sorting from 137s to 12s, with no additional memory usage. There is a numpy fallback path using a radix sort that drops the time from 137s to 85s, with a slightly increased memory cost (34 bytes/spike instead of 32 bytes/spike). The outputs (`ordered_spikes`, `slices`, `order`) are identical to the old implementation. I also tested on synthetic data of various sizes (1M, 10M, 40M spikes) to make sure both paths are strict improvements at all input sizes. 
4. Fixes a bug where the reorder cache was set using a string, then probed by various callers using a tuple (or list), so the cache was being silently missed basically all the time. I defined some constants for the keys and used them everywhere, and made the validation stricter, to minimize the likelihood that it happens again.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `af342e6e2ea6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.