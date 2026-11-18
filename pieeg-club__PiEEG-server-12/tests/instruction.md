# Issue

**Title:** Real time video monitoring

## Description

Adds in-browser, real-time webcam-derived “video context” (blinks/head motion/jaw activity) to augment the dashboard’s LLM chat prompt so the assistant can better attribute likely EEG artifacts, and updates the built static dashboard assets accordingly.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `995222611039`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.