# Issue

**Title:** Added socket buffer size options to api_config

## Description

This allows setting the TCP socket buffer sizes via lsl_api.cfg

I think the default socket buffer size is different on every platform so instead of assuming a default I just set the default to `0` then only update the socket with the API value if it's larger than 0.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d2ec186bbd8c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.