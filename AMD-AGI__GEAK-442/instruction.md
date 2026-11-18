# Issue

**Title:** result recovery when timeout of validation

## Description

## Summary

This PR strengthens E2E recovery evidence for accepted tuning and warm-start results.

- Fixes the E2E workflow temporal-dead-zone failure by initializing carried tuning state before any WarmStart integration path can read it.
- Persists a schema-v2 config checkpoint when a WarmStart-replayed configuration is accepted, while preserving `WarmStart` provenance.
- Requires accepted config, tuning, overlay, and final checkpoints to be successfully written before the workflow can treat the result as committed.
- Extends checkpoint regression coverage for WarmStart config recovery and checkpoint-first result selection.

## Problem and solution

A WarmStart replay can enter the shared integration path before the TuningSkillset block is evaluated. That path reads the carried `tuning` state, which previously caused a `ReferenceError` and terminated E2E before final validation.

WarmStart can also accept a KB-replayed configuration through the same isolated-server, parity, and engagement checks used for config validation. The accepted configuration was carried into later phases but did not persist a schema-v2 recovery checkpoint, leaving interrupted runs dependent on legacy intermediate-result recovery.

This PR initializes the carried tuning state before WarmStart execution, writes an accepted config checkpoint for successful WarmStart validation, preserves the source as `kb_warm_start`, and fails explicitly when accepted recovery evidence cannot be committed.

## Validation

### Offline recovery-log validation

- CPU-local checkpoint recovery tests: `29 passed`.
- Archived recovery-log validation covered 12 historical GEAK cases with canonical workflow-return and Director artifacts selectively masked to exercise recovery fallbacks.
- Recovery results preserved the intended source precedence across canonical return, Director validation, schema-v2 checkpoints, verified legacy final-pair evidence, tuning recovery, intermediate wins, and no-gain synthesis.
- Legacy final-pair recovery was validated against final summaries, independent control/final benchmark summaries, deployment manifests, and server-log engagement evidence.
- Nine completed model E2E artifact cases were replayed through checkpoint recovery: accepted checkpoints were recovered with their measured values, while rejected/no-gain/parity-failed checkpoints were not accepted as wins.

### Real E2E validation

- A real Qwen3-14B-FP8 E2E run completed through Finalize and Validate without the previous TDZ failure.
- The run materialized schema-v2 checkpoints for:
  - accepted WarmStart configuration,
  - accepted TuningSkillset result,
  - accepted overlay stack,
  - accepted final pair.
- The run also produced authoritative Director validation and a recovered `result.json` with `validated_win` status and a `1.4511x` measured throughput speedup.
- The accepted WarmStart checkpoint records `phase: WarmStart` and `validation_level: config_sweep`, proving that WarmStart remains enabled independently of fresh ConfigSweep while its accepted result is now captured as recovery evidence.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7fb9aa58ff1e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.