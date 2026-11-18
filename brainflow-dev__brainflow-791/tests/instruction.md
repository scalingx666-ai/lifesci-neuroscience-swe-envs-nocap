# Issue

**Title:** Create explicit boards for Ganglion v2 and v3 firmwares

## Description

This PR creates explicit boards for the Ganglion v2 and v3 firmwares. 

Supporting two separate firmwares is necessary because some users have older Ganglion boards which require specialized hardware to upgrade the firmware. Most users with these older boards will not be able to upgrade. Newer Ganglion boards support OTA updates and can benefit from bug fixes in current firmware releases.

The current implementation attempts to use the device name advertised by the Ganglion board to determine if the v2 or v3 firmware is in use. This works fine on most platforms, but fails with CoreBluetooth on newer versions of macOS when using native BLE. These problems will likely become more prevalent as support for the Simblee module used in Ganglion has ended.

The proposed change classifies v2 Ganglion boards as legacy devices and creates separate IDs for these boards. The current Ganglion board IDs will default to the v3 firmware. Users who cannot upgrade can explicitly select the legacy firmware when starting a BrainFlow session. This allows users on newer versions of macOS to use the current firmware while maintaining support for legacy devices.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5ebe0757da68`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.