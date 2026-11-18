# Issue

**Title:** Fix clipboard crash on copy and invisible selection in code blocks

## Description

- Copying from a note could crash the app on macOS: the clipboard was written from a background thread while the webview wrote it on the main thread. Native clipboard writes now always run on the main thread, and plain selections are copied without a native write at all (which also removes a spurious copy error toast).
- Selecting text inside a code block now shows the highlight.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `417f683434db`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.