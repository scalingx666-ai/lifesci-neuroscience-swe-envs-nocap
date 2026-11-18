# Issue

**Title:** HBP-220: send logs to elasticsearch based on buffer's size in bytes

## Description

We discovered empirically that the EBRAINS Kibana installation has a relatively low max-upload-limit (1MB).
We have log messages with very diverse size (some messages really small, others very large), thus using a buffer threshold in number of messages was risky. We decided to sum messages size, as they are being cumulated into buffer, and when the buffer (with a threshold in bites - size) is filled, to send the bulk logs submit towards Kibana.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4dc5a824ff21`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.