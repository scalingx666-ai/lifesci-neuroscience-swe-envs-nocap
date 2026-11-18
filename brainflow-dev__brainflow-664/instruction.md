# Issue

**Title:** Fix ganglion firmware v2 packet ordering

## Description

There was a problem with the packet ordering for the Ganglion firmware v2 decompression. In this firmware, a raw packet is sent every 100Hz to "reset" the delta compression. The previous implementation wrote this raw packet in the wrong order and left the sample package where it should have been unchanged. This didn't change the data stream much (it just wrote the same sample twice), but it would cause the same package index to be written twice. This is an issue for downstream clients that use the package index to check if samples have been lost over the bluetooth connection.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a5840365df09`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.