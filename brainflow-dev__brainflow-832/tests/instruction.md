# Issue

**Title:** Add Shimmer3 board support

## Description

##### _Updated PR message to reflect the new commits_

Add native C++ driver for Shimmer3 (Bluetooth SPP)

- New board: BoardIds.SHIMMER3_BOARD (id 68)
- Channels: 3-axis low-noise accelerometer, gyroscope, magnetometer, GSR, ExG, battery, and temperature
- Data: raw ADC values streamed with host-side timestamps
- Runtime config via config_board(): sampling_rate:<Hz> and sensors:<hex>
- Scope: Shimmer3 (hardware version 3) only; prepare_session() rejects Shimmer3R (hardware version 10)

Tested on Windows with a Shimmer3 over Bluetooth SPP via the Python binding

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `746f07bc9b5b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.