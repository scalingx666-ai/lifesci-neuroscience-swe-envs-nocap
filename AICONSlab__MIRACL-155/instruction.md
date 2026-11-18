# Issue

**Title:** [feat/fix] significant re-write of installation script

## Description

Several improvements based on the feedback fiven by @Andrew-Clappison :

- Complete refactor of Bash code
- Added interactive installation menu that runs user through abbreviated installation
- Fixed several bugs
- Added several validations
- Additional new functionalities based on feedback

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3ca844316bbf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.