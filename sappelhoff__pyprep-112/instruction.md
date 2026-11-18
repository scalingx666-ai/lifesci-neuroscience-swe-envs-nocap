# Issue

**Title:** MRG: Add mne logger

## Description

.

I had this on my namespace for a while... (Oct 22. 2021) and I didn't take the time to finish it. 
If I recall correctly, it's missing the ProgressBar class for the 10%... 20%... 30%... print output by the RANSAC (probably the most annoying one when I run this on 40 cores 😅). 
I'll double-check the diff, make sure I didn't miss anything and add the ProgressBar for RANSAC.

Mathieu

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4a91d3178271`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.