# Issue

**Title:** Destroy graphics diagnostic scene windows before shutdown

## Description

The graphics diagnostic can finish its synthetic scene successfully and then segfault during interpreter shutdown on Ubuntu / Python 3.12. Closing the scene GUI only hides its native windows, leaving their destruction to SIP teardown.

Explicitly destroy the scene GUI while QApplication is alive, after disconnecting diagnostic surface and context observers. Add success and injected-failure regression tests that require both native canvases and their GUI to be destroyed before the child returns, and include them in the real OpenGL CI step.

Validation: both new cases fail before the change and pass afterward; all 12 real OpenGL cases pass with CI’s Python 3.12.13 and locked dependencies. The remaining diagnostic tests report 68 passed and 12 opt-in skips. Lint, formatting, and documentation checks pass (documentation drift checked with the intended changelog edit in a temporary index).

The original runner segfault has not reproduced locally; this fixes the demonstrated cleanup gap, and CI must confirm whether it resolves that crash.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e44415d7cf9c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.