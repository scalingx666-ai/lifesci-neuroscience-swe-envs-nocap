# Issue

**Title:** Clear experience window when session is stopped

## Description

When we stopped a session previously the experience window wasn't cleared. Hence the video/ audio would still keep playing and also the buttons/ text would still show.
This fix clears the experience window when the Stop button is pressed in the session control plugin.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e6aaf1a2ecca`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.