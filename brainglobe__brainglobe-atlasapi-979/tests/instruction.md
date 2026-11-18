# Issue

**Title:** Change overwrite parameter default to True

## Description

Every single time i run an atlas script I forget to set overwrite to True. I think defaulting to True might be better behaviour. I cant think of a time when you want to rerun atlas generation, but the previous files are too valuable to overwrite? I would perhaps go further to say we should get rid of the option to even set overwrite. 

I am open to the feedback of others here? what are some scenarios where overwrite being False is useful?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9a492ee013e5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.