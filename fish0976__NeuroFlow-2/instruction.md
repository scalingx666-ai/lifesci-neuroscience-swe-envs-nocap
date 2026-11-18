# Issue

**Title:** Add OpenBCI Cyton streaming adapter

## Description

﻿## What changed

- add an optional BrainFlow adapter for OpenBCI Cyton
- add a live WebSocket streaming path with device metadata and signal quality
- keep the existing PhysioNet replay and mock hardware sources unchanged
- add beginner setup documentation and an optional hardware dependency file
- add tests for the Cyton source catalog and lazy initialization

## Validation

- 27 Python unit tests passed
- backend Python compilation passed
- Vue production build passed
- live mode reports a clear configuration error when BrainFlow or the serial port is not configured

The Cyton-specific prediction model remains disabled until data is collected and calibrated for the 8-channel, 250 Hz device profile.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7e39d50c1a64`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.