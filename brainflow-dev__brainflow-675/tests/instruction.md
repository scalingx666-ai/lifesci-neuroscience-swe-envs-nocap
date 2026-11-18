# Issue

**Title:** Support Ganglion v3 detection on MacOS native BLE

## Description

Firmware version detection for Ganglion depends on parsing the advertised name of the device. On MacOS, the device name is always discovered as "Simblee" rather than the name intended to be advertised by the firmware. Since the device name is not determined correctly, the correct Ganglion firmware cannot be determined on MacOS.

This PR solves the above problem by reading the BLE Software Revision String characteristic. This characteristic explicitly provides the correct device firmware version.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5b3a118495df`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.