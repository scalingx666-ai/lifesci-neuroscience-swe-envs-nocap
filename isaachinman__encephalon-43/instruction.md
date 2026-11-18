# Issue

**Title:** [MAR-2564] Centralise SQLite error classification

## Description

## Human summary

SQLite failures now receive one consistent interpretation, so extended busy, corruption, read-only, and file errors follow the correct cache, lock, and public-error behaviour.

## Summary

- Add one pure internal classifier for numeric, symbolic, and bounded message-only SQLite errors.
- Normalise extended result codes while giving structured numeric codes precedence over contradictory text.
- Keep cache recovery, operation-lock recovery, and public wrapping as explicit consumer policies.
- Preserve existing public error codes and sanitised messages while preventing non-SQLite errors from being misclassified by broad words.
- Add mutation-sensitive unit and integration coverage for cache, gate, recovery-held, and public-boundary behaviour.
- Document the recoverable and terminal category contract.

Linear: https://linear.app/marcoappio/issue/MAR-2564/sqlite-centralize-extended-result-code-classification

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3e6a73344131`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.