# Issue

**Title:** Expanded timer, name setter and cleanup

## Description

This PR covers a few different areas and features that you may want in your repo (or may not).

- Cleans up various stored files, logs, ip.js, classifier.json. They're now deleted and created on run. The classifier was re-created each run so the saved version was overwritten if I understood that right.
- Refactors how skills are loaded to allow them to register routes with express.
- Improves the timer functionality. Multiple timers, better parsing. Now supports multiple units such as "Set a timer for 10 minutes and 30 seconds."
- Adds the ability to change the name through a query and stores this value.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `714dea46e8f3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.