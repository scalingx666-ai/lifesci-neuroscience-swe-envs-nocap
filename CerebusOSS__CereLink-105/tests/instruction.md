# Issue

**Title:** Parse packets based on channel caps instead of channel number

## Description

* As much as possible, parse packets based on the channel capabilities instead of the channel number.
* Fixes a bug where digital in and serial in events were not being interpreted
* Fixes a bug where digital and serial data couldn't be above 6
* Fixes a bug where events (spikes, digital, and serial) were skipped if they came in packets between the calls to InitTrialData and GetTrialData. Note that user memory allocation occurs between these calls so this is a non-trivial amount of time.
* Updates Python wrapper with above changes.
* Python wrapper also updated to not reset the clock by default, even if the buffer is reset. I only did this where event data were involved. It might be true for continuous data too but I won't be able to test continuous data for a while.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3093330a7a05`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.