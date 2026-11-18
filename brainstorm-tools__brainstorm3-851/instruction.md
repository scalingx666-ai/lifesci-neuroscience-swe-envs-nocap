# Issue

**Title:** Allow overlay on volume of choice

## Description

Based on our discussion in Slack, this PR allows user to choose on which volume they want to overlay rather than just overlaying on the default MRI.
<img width="500" height="250" alt="image" src="https://github.com/user-attachments/assets/77e70a2f-0ddd-4fb0-98f5-cf868eaa1fcb" />

If there is just one other volume other than the default MRI then it shows the option to overlay on default MRI.
<img width="400" height="200" alt="image" src="https://github.com/user-attachments/assets/2696dc27-f39a-44a1-b806-fad9d6c109a5" />

@tmedani

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bb51828af560`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.