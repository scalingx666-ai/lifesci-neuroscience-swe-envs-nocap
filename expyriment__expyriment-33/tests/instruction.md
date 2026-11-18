# Issue

**Title:** Exit android

## Description

NEW: Force quitting experiment with mouse events (triple click in on of screen corners)

new static class method Mouse.process_quit_events() (similar to Keyboard.process_control_keys()) (see docu) It is handy especially for Android. It is therefore activated by default under Android (upper, right corner)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b34cf8a5da6f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.