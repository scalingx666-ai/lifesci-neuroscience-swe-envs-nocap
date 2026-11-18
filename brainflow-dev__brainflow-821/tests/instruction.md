# Issue

**Title:** Fix for Empty except

## Description

To fix this without changing behavior, keep the timeout handlers but add explicit explanatory comments in those `except` blocks to document that timeout is expected during polling and the loop should continue.

Best single fix:
- In `emulator/brainflow_emulator/biolistener_emulator.py`, update the two empty `except` clauses in the receive loop:
  - `except TimeoutError:`
  - `except socket.timeout:`
- Replace `pass` with `pass` plus a short comment (or just a comment plus `pass`) explaining that timeout is normal when no command is received and should not be logged as an error.

No new imports, methods, or dependencies are required.

_Suggested fixes powered by Copilot Autofix. Review carefully before merging._

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1a3aa670062a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.