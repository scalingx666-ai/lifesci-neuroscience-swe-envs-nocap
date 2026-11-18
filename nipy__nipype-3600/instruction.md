# Issue

**Title:** Use out_prefix instead of "w" in spm.Normalize12

## Description

Please consider this PR that will be fast to review:

I think there are two solutions.
1- Remove the `out_prefix` parameter and the prefix remains always at "w" 
or
2- use the `out_prefix` parameter instead of the hard-coded "w" value.

I think the second solution is the right one. 
I propose a slight modification to this effect.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `83d52f93b062`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.