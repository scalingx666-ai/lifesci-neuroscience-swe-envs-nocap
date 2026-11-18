# Issue

**Title:** feat(runtime): add managed background jobs for long compute

## Description

## Summary

OSS half of #523; hosted capability sync is in the linked BrainPilot-cloud PR.

- adds `run_in_background` for finite long compute jobs outside the 300-second Bash cap
- reuses the bounded Monitor process manager for timeout, stdout progress, event-driven wakeup, Stop cancellation, and terminal status
- requires explicit `timeout_ms` (max 60 minutes) and forbids persistent mode
- exposes the tool only to Engineer and Experimentalist when `builtin.monitor` is available
- fixes the execution contract so agents are instructed to use a tool that physically exists
- keeps `start_monitor` reserved for observation/persistent watches

## Verification

- targeted Background Job / Monitor / tool-access / execution-contract suite — 44 passed
- full Runtime suite — 65 files / 658 tests passed
- Runtime production build passed

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1d08657b6e84`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.