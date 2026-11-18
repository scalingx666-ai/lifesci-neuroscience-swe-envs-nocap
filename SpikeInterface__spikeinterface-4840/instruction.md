# Issue

**Title:** Filter subsets of channels at a time to reduce peak memory

## Description

Follows the discussion in #4813 (Filter in float32 if data is not float64) and #4837 (Implement filtering by banks of channels to reduce RAM).
`sosfiltfilt` and `filtfilt` make several float64 copies of their input, so filtering a 1 GiB int16 trace peaks at 10 times its size. This PR filters one channel at a time in `FilterRecordingSegment.get_traces` and writes each result into a preallocated output, which takes the peak down to 1.02 times the trace size (the output array is almost all of it). The output is identical to main for the `sos` and `ba` forms, forward-backward and causal.

I did not add a parameter for how many channels to filter at a time, as I don't want to get into how to expose it in this PR. Larger blocks are a bit faster (best is 8 to 16 channels, 9.7 s against 12.7 s) and use more memory, as the figure shows, but the gain is small next to the memory gain here. I would merge this and then discuss separately a common interface to run preprocessing operations per channel, as that needs more research first. Basically, I don't want to get us bogged down discussing an interface where there is an obvious gain to be picked. 

<img width="2100" height="840" alt="image" src="https://github.com/user-attachments/assets/4f8020e3-36ef-4bd1-bcf0-c3095f0d3505" />

`sosfiltfilt`, float64 coefficients, default bandpass (5th order Butterworth, 300 to 6000 Hz), 1 GiB int16 trace (384 channels, 46.6 s at 30 kHz). The peak includes the output array, the time is the best of 3 runs.

The `ba` form (`filtfilt`) behaves the same way on the same trace, one channel at a time against all channels at once:

| filter | peak memory (% of trace) | time |
|---|---|---|
| bandpass `ba`, main | 1000% | 26.3 s |
| bandpass `ba`, this PR | 102% | 15.1 s |
| notch (`iirnotch`), main | 1000% | 20.4 s |
| notch (`iirnotch`), this PR | 102% | 13.4 s |

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2e03e6ed7bc3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.