# Issue

**Title:** Fix thresholds + refactoring on inherited changes in PSC Inter time stamps

## Description

- fix manual editing neg threshold
- fix reseting thresholds while getting new map data

**Note**:
I have fixed reset thresholds if we get zero map image, but we should check getting map images in triplanar mode because periodically (alternating) we get a zero map. It can be seen in the log.

![2020-03-05_22-28-46](https://user-images.githubusercontent.com/1299189/76018348-08915580-5f31-11ea-82d8-2ae673ed8b29.png)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `10f5c9edabfb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.