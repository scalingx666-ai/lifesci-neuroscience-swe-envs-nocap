# Issue

**Title:** Raise PARRECError for a general information line without a colon

## Description

A general information line with no colon, such as one cut off in the middle of a PAR file, made _split_header fail with AttributeError: 'NoneType' object has no attribute 'groups'. This change raises PARRECError instead, which is the error class the module uses for malformed headers.

Only the exception type and message change for this input. I added a test with a header cut in the middle of a general information line. It fails on master and passes with this change.

The parrec tests pass. The full suite has 12 failures in test_scripts.py because console scripts are not installed in my environment; the same 12 fail on master.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e3026a823b46`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.