# Issue

**Title:** Misc. Fixes

## Description

* Stop automatically enabling Brainflow driver whenever starting a device search even when it was disabled
* Backported some Qt fixes for BTLE on Windows
  * 
  * 
  * [3](https://codereview.qt-project.org/c/qt/qtconnectivity/+/392128)
* Make Auto-Detection work fine again with BTLE (at least on macOS)
* Filter for HRM and only show device popup if more than one HRM found
* Improve BTLE logging for HRM
* Check for BTLE support on Bluetooth device before doing anything BTLE like with it

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0ec4933ddeff`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.