# Issue

**Title:** Fix disconnect of devices that drift

## Description

Device inactivity was inferred from mNumNewSamples of channels which can stay at 0 for some time because of drift-correction (e.g. larger thread blocks), even though the channel is actively receiving data and the device is fine. This caused devices (especially on larger app blocks) to get disconnected, especially when switching classifiers/experiences. Now device activity is inferred from isactive state of the channel, which is more safe.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `87fa95819d64`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.