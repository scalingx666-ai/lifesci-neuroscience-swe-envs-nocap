# Issue

**Title:** Reset Network.run state after callback errors

## Description

Stopping a simulation with multiple clocks can skip pending ticks on resume. When the stop time comes from a later clock, the next run advances the other clocks past their pending ticks.

The fix uses the earliest pending clock for the stop time. Tests cover stop and resume with and without profiling.

Tested with `.venv/bin/python -m pytest -q brian2/tests/test_network.py -k stop_with_multiple_clocks`.

Assisted by Claude/Codex.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `580dc760a88f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.