# Issue

**Title:** Load log settings before all other settings.

## Description

Loading the log settings last causes heaps of INFO messages to be
displayed by lsl::get_local_interfaces() even if the user has set log level to -3.
Changing the order causes less ui clutter and respects the users choices.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9ab85417dc6a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.