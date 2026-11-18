# Issue

**Title:** ShowTextInput State-Machine Action

## Description

* Adds new `ShowTextInput` and `HideTextInput` actions to state-machine states.
* Implements both actions in `ExperienceWidget` rendering a `QPlainTextEdit` above the exiting `QPushButton` controls

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `29e6a2ee3e9e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.