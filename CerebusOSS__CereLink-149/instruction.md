# Issue

**Title:** Update representations of time to use PROCTIME instead of uint32_t

## Description

So far we've changed the internal representations of time to PROCTIME, which will be `uint32_t` if using the old cbproto 3.11 else `uint64_t`. 

However, we are still casting this to `uint32_t` to copy the data into the user buffer because the helper functions to allocate memory for the user are still allocating `uint32_t`.

e.g., `cbSdkTrialEvent` has `void * timestamps[cbMAXCHANS][cbMAXUNITS + 1];`, and `SdkInitTrialData` tells us how many samples and channels we have.
The cython helper method `trial_event` will allocate the data for us, but the allocated type is `cdef np.uint32_t[:] mxa_u32` whereas we need this to be uint64 if we're on the new protocol.

We also allocate the timestamp buffer using uint32_t in simple_io.cpp in the samples.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `34ee4d9dfd74`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.