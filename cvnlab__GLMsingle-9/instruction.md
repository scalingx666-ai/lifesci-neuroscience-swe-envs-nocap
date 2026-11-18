# Issue

**Title:** Fix shape indexing when truncating design or data in check_inputs()

## Description

I hope this is actually a fix and not a misinterpretation of your code.

In check_inputs, when truncating 'data', I found 'design' was not indexed for the 'run_i' in question (which seems to be done in order to determine the number of desired samples) which naturally threw an error for me.

Similarly, when truncating the 'design', the number of desired samples was determined by 'data[run_i].shape[0]' but I think the time dimensions of 'data' is actually the last, so it should be 'data[run_i].shape[-1]'.

Does that make sense?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7190670d87fd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.