# Issue

**Title:** add support for plotjugler udp json streamer

## Description

Cmd example to enable it in brainflow: `board.add_streamer("plotjuggler_udp://127.0.0.1:9870")`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `325c20a5a93b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.