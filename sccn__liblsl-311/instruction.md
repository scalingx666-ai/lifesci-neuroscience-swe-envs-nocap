# Issue

**Title:** Prevent incompatible sync handshake with older client

## Description

This was a cascading error from the double parsing issue in #310 , because it parsed it incorrectly the protocol version was wrong, the `liblsl` versions were both the latest so the actual data went through correctly (but downgraded to protocol 1.0). A client with an older library version would not be able to correctly parse the data stream with sync.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `42118f80ff92`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.