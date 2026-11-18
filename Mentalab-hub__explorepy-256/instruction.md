# Issue

**Title:** Apis 773 refactor packets.py

## Description

- EEG packets now share a common convert function and set v_ref and n_packet at init to be used in convert
- checkfletcher has been pulled into the parent Packet class
- Parent, EEG and EventMarker cannot be instantiated anymore
- status bytes are now parsed and saved in a "status" dict per packet
- test resources reflect the changed status field
- tests reflect the changes
- create in ExternalMarker raises a ValueError if invalid values are passed (invalid values are values that aren't strings or not between 1 and 16 characters long)
- Calibration packets now save single values for slope and offset instead of numpy arrays

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `55eaf31f8eb1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.