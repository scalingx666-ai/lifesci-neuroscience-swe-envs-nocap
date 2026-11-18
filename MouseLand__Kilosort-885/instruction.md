# Issue

**Title:** Fix OMP_NUM_THREADS bug

## Description

Hi,

if OMP_NUM_THREADS is not set already it will be set to a string instead of a int here below.
https://github.com/MouseLand/Kilosort/blob/326a00dd2c6f130fff96505295b88965cc09a21e/kilosort/spikedetect.py#L74-L83
This was happening on my windows machine and crashing the code. 
7 seems to work fine, the msg text is currently unused, not sure it is important to keep it or not.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `326a00dd2c6f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.