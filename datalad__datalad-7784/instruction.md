# Issue

**Title:** Add testing and compatibility fixes for Python 3.14 support

## Description

There are fresh reports of massive issues in nixos with 3.14:
-  (by @sarahec)

appveyor might be decomissioned soon (attn @mih) so I am not even touching those files.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0901b42512a1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.