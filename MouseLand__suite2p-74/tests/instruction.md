# Issue

**Title:** Support additional 2p file formats through haussio

## Description

Add support for native non-tiff PrairieView and ThorLabs data sets if haussmeister.haussio is available. The file format is automatically detected by [`haussio.load_haussio`](https://github.com/neurodroid/haussmeister/blob/master/haussmeister/haussio.py#L1381). Support for ScanImage4 and Doric Studio could be added, but they are not automatically detected at this time.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6014f3ea2fa1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.