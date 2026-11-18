# Issue

**Title:** Bugfix: Correct conversion of EEG points from Polhemus file on reviewing CTF data

## Description

Solve the two issues reported in #793

1. First, when loading a CTF dataset with .pos file that includes EEG coordinates, they are not saved in Bst.

On importing CTF data, it checks for position of EEG channels in the `.pos` file if any, and add these locations in `'Native'` coordinates, they are later converted in SCS. Solved in commit: 026342f1858fb02435319265048f811b1e33d6ba

2. When adding EEG positions from the `.pos` file, `import_channel` does not applies the (Native) CTF to SCS transformation

This was a bug, that came from the transformation from `RawPoints=>Native`, as an temporal `SCS` field was kept in `ChannelMat`. Solved in commit: a61d9ea97dc37ce2c913fe285dbbba9bb3045742

3. Fixes a bug in temporarily renaming fiducials. This bug did not have any consequence.
Solved in commit: 16b9db4eda71a453ee2ae8cc9179a58fb99dd607

## Results
On provided data:

1. On importing CTF data MEG+EEG with a `.pos` file with EEG points

| Before    | After |
| -------- | ------- |
| <img src="https://github.com/user-attachments/assets/d1f8a6fa-20f2-4a0d-93cf-5a755734db7d" width="100%">  | <img src="https://github.com/user-attachments/assets/a4b29c03-7ba2-4f3d-a6dc-16070c0e5b58" width="100%">  |


2. On adding EEG positions from a `.pos` file with EEG points

![image](https://github.com/user-attachments/assets/1ae70f7f-e863-462b-a399-896fa48bf4d1)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `75522138a91e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.