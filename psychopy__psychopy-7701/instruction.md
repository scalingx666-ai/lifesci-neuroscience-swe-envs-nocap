# Issue

**Title:** RF/EN: Improved webcam recording latency, stream sharing between components, and automatic polling

## Description

Changes to the camera library in this PR:

* Lower latency starting/stopping recordings within routines, scheduling recording start and stop times are now possible
* Support for microphone recording using alternative backends (e.g. sounddevice instead of PTB)
* Support for multiple camera components accessing the same device, even simultaneously, within the same routine
* Camera streams are now polled automatically in another thread so cameras don't need their `update()` method called manually anymore
* Better device manager integration
* Various bug fixes in helper functions
* Preliminary Linux support for cameras

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c2c108b91b06`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.