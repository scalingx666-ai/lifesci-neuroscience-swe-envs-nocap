# Issue

**Title:** Fix buffer overflow in output_spikes_parallel with zero spikes

## Description

Fixes:

## What

When `num_spikes == 0`, `malloc(0)` followed by `strcpy(spike_data, "")` triggers glibc's FORTIFY_SOURCE buffer overflow detection on Linux.

## Fix

- Allocate at least 1 byte: `malloc(num_bytes > 0 ? num_bytes : 1)`
- Use direct assignment `spike_data[0] = '\0'` instead of `strcpy`

## Testing

Reproduces in neurodamus CI (`test_v5_coreneuron_no_lfp_smoke`) on Ubuntu when tstop is too short for any cell to fire.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `849884309949`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.