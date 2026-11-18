# Issue

**Title:** fix(reg): Only use `resolveBackend` to get device class if existing class *isn't* correctly subclassed

## Description

This is why the test suite is failing currently; JoystickDevice gets is class resolved by DeviceManager to be the current default backend, rather than the base class, so when we test the device manager contract it fails because the created device isn't an instance of the resolved class.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7c19decdd71d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.