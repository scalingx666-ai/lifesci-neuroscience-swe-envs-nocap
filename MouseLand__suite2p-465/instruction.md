# Issue

**Title:** bad_frame with bin_movie()

## Description

Hi, 

This pull request fixes the ops['nbinned'] change bug mentioned in #463 and fixes some other BinaryFile and bad_frame handling bugs found in  bin_movie() along the way (good catch about the bad_frames potential problems, @carsen-stringer!).  It  also includes a few unit tests on bin_movie() and BinaryFile to ensure the problems don't come up again in the future.

 

Best wishes,

Nick

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d2dba9e6e3f4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.