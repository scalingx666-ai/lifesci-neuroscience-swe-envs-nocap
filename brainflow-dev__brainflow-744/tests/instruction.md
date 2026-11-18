# Issue

**Title:** Fix EEG names for Muse 2, Muse S, Muse 2016

## Description

### Description of Changes
I noticed that the `eeg_names` for the Muse 2 I am using were incorrect. Upon checking, it seems that the names have changed.

Original: TP9, Fp1, Fp2, TP10
Updated: TP9, AF7, AF8, TP10

### Reference
https://github.com/brainflow-dev/brainflow/blob/master/src/board_controller/muse/inc/muse_constants.h
```
#define MUSE_GATT_ATTR_TP9 "273e0003-4c4d-454d-96be-f03bac821358"
#define MUSE_GATT_ATTR_AF7 "273e0004-4c4d-454d-96be-f03bac821358"
#define MUSE_GATT_ATTR_AF8 "273e0005-4c4d-454d-96be-f03bac821358"
#define MUSE_GATT_ATTR_TP10 "273e0006-4c4d-454d-96be-f03bac821358"
```
![image](https://github.com/user-attachments/assets/95a02ea4-a9c2-4434-9039-bbb3a7dbb5e3)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3c98d025b47c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.