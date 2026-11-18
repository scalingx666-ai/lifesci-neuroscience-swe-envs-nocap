# Issue

**Title:** Fix timestamp bug when using nPlay

## Description

Our clock conversion was getting poisoned with a bad state when the cbsdk session was initialized for NPLAY when connected to a legacy NPLAY session. This is because Legacy nPlay uses clock ticks, not nanoseconds, but there is no way for us to know that until we get a PROCREP packet near the beginning of the response to REQCONFIGALL.

This fix resets the clock sync state after that packet is received and we determine that we are non-gemini (i.e., non nanosecond timestamps).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4a44b55e8c07`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.