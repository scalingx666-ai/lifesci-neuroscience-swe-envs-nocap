# Issue

**Title:** Unified Segmentation

## Description

I am finally happy with US, so let's merge!
Thanks @liamchalcroft for the initial heavy work!

I think I got a nice and efficient MRF with learned weights working now. I'll upload the derivations at some point after the writing is cleaned up.

Remember that we don't have a maff8 equivalent for the moment.For now, it is advised to align the data to the template space with SPM.

@brudfors

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e05c460f22d5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.