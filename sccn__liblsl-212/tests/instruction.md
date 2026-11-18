# Issue

**Title:** fix: avoids deadlock when requesting info on disconnected inlet

## Description

* Adds test to for calling info on a disconnected stream_inlet to testing/ext/discovery.cpp
* Fixes deadlock that occurred by checking return value of buffer.connect and throwing a system_error based on the error_code in buffer if the check fails.

issue: sccn/liblsl#201

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6a85d6f96916`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.