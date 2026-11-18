# Issue

**Title:** CT masking for hiding region outside skull

## Description

When users select CT2MRI registration as per https://neuroimage.usc.edu/brainstorm/Tutorials/ImportAnatomy#Import_CT, 
this will prompt the user if they want to clean the CT as under so as to mask out unwanted regions/wiring/artefacts out side the skull area.
![Screenshot 2024-02-02 131721](https://github.com/brainstorm-tools/brainstorm3/assets/21283733/4d81956a-6dc6-4101-a723-7415404917d4)

This is without masking and how it currently generates in BST or if the user selects **No** above:
![Screenshot 2024-02-02 132651](https://github.com/brainstorm-tools/brainstorm3/assets/21283733/8f9f22f2-1487-4dd4-911e-1d149d5f72c2)

If the user chooses **Yes** then:
![Screenshot 2024-02-02 132413](https://github.com/brainstorm-tools/brainstorm3/assets/21283733/ccf89e11-5bb8-42bd-967e-afab406f009a)

This gives a clean CT to perform operations on.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4144f4416c21`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.