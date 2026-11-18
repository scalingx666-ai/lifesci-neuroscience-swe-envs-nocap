# Issue

**Title:** io.keyboard: low_performance wait

## Description

* Added `low_performance` parameter to io.Keyboard.wait and io.Keyboard.wait_char (default=False)
* Removed `time.sleep(0.0005)` from io.GamePad.wait_press

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6eeedf5e2609`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.