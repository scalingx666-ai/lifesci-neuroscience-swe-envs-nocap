# Issue

**Title:** Implements bufferable put requests

## Description

This allows puts into gbucket to occur much faster.  I was able to load a 512x512x512 volume (grayscale or labeblk) in 10-20 seconds.

I noticed that the server is running out of memory on small google VMs (<16 GB).  It is unclear whether this is because the new buffering code is inefficient or whether this is an old issue masked previously since DVID is usually run on much larger machines.
- This code change should not impact the previous implementation but a full regression should be run before accepting the request. *

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3e79ae8e3abc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.