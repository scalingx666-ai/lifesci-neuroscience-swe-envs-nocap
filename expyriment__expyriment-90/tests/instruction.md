# Issue

**Title:** Wait methods additions

## Description

This is an attempt to make the wait methods more similar in usage.

The following has changed:
- `control.set_develop_mode` got parameter `skip_wait_functions` which toggles `_internal.skip_wait_functions`
- all wait methods in `io` got the parameter `process_control_events` (replacing the old `process_control_keys`, which check for both `io.Keyboard.process_control_keys` and `io.Mouse.process_quit_event`. `process_control_events` defaults to `True`.
- all wait methods in `io` got the parameter `function` (like `misc.Clock.wait` has)
- `misc.Clock.wait` got the parameter `process_control_events`, which does the same as above. Here it defaults to `False`, however.
- all wait methods pump the Pygame even queue if neccessary

**Please thoroughly review and test before merging, as the changes are in timing-critical parts!**

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ef5187d021fa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.