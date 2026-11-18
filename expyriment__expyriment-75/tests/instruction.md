# Issue

**Title:** Fix for pyserial version 3.0.

## Description

I changed the `get_available_ports()` method to list the first item in the objects returned by `serial.tools.list_ports.comports()` (i.e. the full device names only).

`misc.get_system_info()` will now return the full list (i.e. including descriptions of devices) from `serial.tools.list_ports.comports()`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `985c7c96a947`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.