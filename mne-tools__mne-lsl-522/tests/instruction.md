# Issue

**Title:** Add locks around buffers to prevent race condition between the stream's acquisition and epoch's acquisition thread

## Description

@jasmainak I believe this PR will fix the issue you had- thank you very much for the report! Could you give it a shot and let me know how it goes?

I think there are 2 elements in your script that yield the variable epoch count:

1. (bug) The race condition between the stream's acquisition thread (which writes `_buffer` and `_timestamps` in 4 non-atomic operations) and the epochs stream's acquisition thread (which reads both attributes to detect events). When the reader captures a rolled buffer with unrolled timestamps, events get wrong timestamps, bypass the `last_ts` deduplication filter, and are counted again. Aren't threads fun? 😅
2. (expected) The script's last epoch (number 10) is actually never captured since it extends up to `t=30.44s` which is 438 ms past the end of the data. `mne.Epochs` also drops it with `TOO_SHORT`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a338d07cfb76`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.