# Issue

**Title:** Filter subsets of channels at a time in `gaussian_filter` to reduce peak memory

## Description

This PR continues #4840 (Filter subsets of channels at a time to reduce peak memory), now for `gaussian_filter`. It had the largest peak in the overview I posted in #4837 (Process channels in banks in preprocessors to reduce RAM usage).

`GaussianFilterRecordingSegment.get_traces` takes the FFT of all the channels at once and keeps several complex copies of the chunk around. So an int16 chunk peaks at 28 times its size. This PR filters 16 channels at a time (reusing `NUM_CHANNELS_PER_BLOCK` from `filter.py`) and writes each block into a preallocated output. The peak goes down to 2.5 times the chunk and it is a bit faster too. The output is identical to main for bandpass, lowpass and highpass, on int16 and float32 traces, at the edges of the recording and on a subset of channels.

| chunk | peak memory (% of chunk) | time |
|---|---|---|
| 1 s, main | 2817% | 0.55 s |
| 1 s, this PR | 252% | 0.35 s |
| 10 s, main | 2809% | 6.16 s |
| 10 s, this PR | 251% | 5.93 s |

Neuropixels recording, 384 channels at 30 kHz, int16, default `gaussian_filter` (300 to 5000 Hz). The peak is from `tracemalloc` and includes the output array, the time is the best of 3 runs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `948ff2b75f59`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.