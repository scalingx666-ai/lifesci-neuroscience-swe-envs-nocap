# Issue

**Title:** Interactive dipole fitting: add STC mesh controls

## Description

When adding an stc to guide the interactive dipole fitting, add the STC Color Limits controls to the dock. It's easy to add other STC controls as well, but I think this is all we need for now.

<img width="3122" height="1570" alt="image" src="https://github.com/user-attachments/assets/424cb523-8726-42d7-a8dc-ad283863c645" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `982d7a03093b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.