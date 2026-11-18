# Issue

**Title:** Display sensitivity map for NIRS

## Description

This is the continuation of  allowing to display the nirs sensitivity directly from the GUI.


Todo: 
- [x] Display each wavelength separately 
- [x] Add possibility to threshold? -- can be done already using surface button
- [x] Correctly display the source and detector instead of the midpoint 

Optional: 
- [x] Same scale for all sensors (using maximum: custom mode)


Future work: 

- Display channels on top of the sum channel 
- Export a video like this 

https://github.com/user-attachments/assets/dbc56b8b-cfbb-4616-ac56-6dec4ab42c2a

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a7a6c45d7157`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.