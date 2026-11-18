# Issue

**Title:** fix(runtime): make Stop a hard model-context boundary

## Description

.

Production v0.2.0 QA reproduced a stricter Stop regression after #527: the immediate recovery prompt was answered, but the interrupted turn's stale tool/Trace work then resumed, wrote a report, and injected the old answer.

This patch captures the Pi SessionManager leaf before each top-level BrainPilot prompt. Once Stop has fully settled, it branches the persisted Pi session and the live in-memory Agent message state back to that completed checkpoint. BrainPilot's visible audit history remains unchanged; only unfinished model/tool context is excluded from the next prompt. Existing two-sided queue clearing remains in place.

## Validation so far

- targeted Stop/event mapping: 24 passed
- runtime full suite: 65 files / 671 tests passed
- root typecheck passed
- runtime production build passed

The PR remains Draft until the exact production reproduction passes against a real-provider 208 sandbox image built from this commit.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b0ee718d8d3e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.