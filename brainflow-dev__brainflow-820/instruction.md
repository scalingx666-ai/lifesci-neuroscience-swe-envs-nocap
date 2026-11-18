# Issue

**Title:** Fix for Empty except

## Description

To fix this without changing behavior, keep the exception suppression during socket cleanup but add an explanatory comment and lightweight logging in the `except` block. This satisfies the rule’s requirement and preserves reconnect flow.

Best change in `emulator/brainflow_emulator/biolistener_emulator.py` (around lines 114–118 in `run`):
- Replace the `except Exception: pass` with:
  - `except Exception as close_err:`
  - a short comment explaining close failures are expected/ignorable in reconnect cleanup
  - `logging.debug(...)` including the exception for diagnostics.

No new imports or dependencies are required (the file already imports `logging`).

_Suggested fixes powered by Copilot Autofix. Review carefully before merging._

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1a3aa670062a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.