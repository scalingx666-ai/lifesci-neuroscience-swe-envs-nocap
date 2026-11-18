# Issue

**Title:** adding work directory

## Description

So this does two things to `__main__.py`. 

Firstly, it allows for users to specify a working directory with --work_dir or -w. This then sets the base_dir argument which was already in place. 

Second, I also trimmed white spaces and ran autopep8 for the other cosmetic changes made.

Motivation behind change: I've been running this on a cluster and getting some time out issues. And the tempdir is erased on the local compute nodes. So I want to keep the temp directory so I don't have to start over.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9419e0c02f0c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.