# Issue

**Title:** Local callback_function fixes.

## Description

Added checks for `CallbackQuitEvent` to the local `callback_function`.

One thing we still might to check is that some wait methods (e.g. in Keyboard) will always respond to quit events by setting `done=True`, such that the rest of the loop is still processed, while others (e.g. in Clock) will do a `break`, leading to an instant return. We might want to have consistent behaviour there.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2868238a6593`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.