# Issue

**Title:** ENH: Do not clip to background volume by default

## Description

This changes the default clipping to background option to now be Off. This is based on multiple user feedback including a Slicer weekly hangout discussion where it was described that changing this default made sense. It helps in cases of manually moving/registering multiple volumes in slice views. The change also provides a default full context of overlaying 2 volumes occupying different spatial bounds. Users can still choose to clip to background, but it is no longer the default.

Meeting notes from the hangout that discussed this can be found at https://discourse.slicer.org/t/2026-09-22-weekly-meeting/48180.

<img width="390" height="184" alt="image" src="https://github.com/user-attachments/assets/94e55452-4c03-492f-b2a9-dbfeefbaf5f2" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `311cf24b61b3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.