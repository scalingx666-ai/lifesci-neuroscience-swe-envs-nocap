# Issue

**Title:** Save `dtype` in `phase_shift` kwargs

## Description

I am reviewing #4563 by @galenlynch and I noticed that it also fixes a bug on main: `phase_shift` does not store `dtype` in its kwargs. A recording built with `dtype="float32"` comes back with the parent dtype when it is reloaded from its dict, and `save` with `spawn` workers (the default on macOS and Windows) writes values rounded to integers because the workers rebuild the recording from that dict.

This PR peels that fix off from #4563 as that PR has been waiting for a while and this is something we can merge independently. The fix is @galenlynch's, so the commit credits him as co-author. I also added a test that fails on main.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `98aeee60ca08`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.