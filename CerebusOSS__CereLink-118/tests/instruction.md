# Issue

**Title:** cbpy: Fix error handling in get_sample_group

## Description

When cbSdkGetSampleGroupList returns an error the nChansInGroup variable
is in fact uninitialized so it can be any number, and usually very large.
As such looping over range(nChansInGroup) results in problems due to
undefined behavior, for example segfaults or a ZeroDivisionError when
dividing by digRange because it is unitialized for out-of-range channels.
Fix this by producing one single error when requesting a non-existing
sample group, and returning immediately in that case. Remove the extra
call for getting the number of channels since it's incorrect to test the
nChansInGroup variable.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3c076b48bee4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.