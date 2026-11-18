# Issue

**Title:** FIX: Disable -T2pial and -FLAIRpial at -autorecon1 stage

## Description

FreeSurfer 7 will enable T2pial/FLAIRpial processing when passing `-T2` or `-FLAIR` images. This breaks our model of passing in T2w/FLAIR images at -autorecon1, as -T2pial comes much later.

This change moves `-noskullstrip` out of a kind of hidden function and puts it in the workflow, and adds `-noT2pial` and `-noFLAIRpial` to `-autorecon1` to mitigate this bug. This should have no impact on FreeSurfer 6, as recon-all is very forgiving of `-no` flags that do not change anything.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2ed6cbfe671e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.