# Issue

**Title:** Webhook engine

## Description

Adds a webhook “engine” to PiEEG: the server persists webhook rules and relays outbound HTTP requests, while the dashboard UI lets users create rules and performs client-side trigger evaluation (FFT-based) to decide when to fire.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f89ab56da2ca`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.