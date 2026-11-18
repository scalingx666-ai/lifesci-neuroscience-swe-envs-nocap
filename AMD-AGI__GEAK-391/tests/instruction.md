# Issue

**Title:** fix: GEAK reports misleading raw-session baseline divergence

## Description

## Background

GEAK currently compares its accepted-config baseline against both:

- the orchestrator's original raw-session baseline; and
- the orchestrator's current-best throughput on the same accepted config.

The raw-session comparison includes optimization gains accepted before GEAK
starts, so it is not a pure measurement-drift signal. The existing
`baseline_divergence_pct` name makes that distinction unclear and can cause a
large accepted configuration gain to be interpreted as cross-harness drift.



## Changes

- Rename `baseline_divergence_pct` to
  `raw_session_baseline_divergence_pct` to make its audit-only semantics clear.
- Add `current_best_same_config_divergence_pct` as the explicitly named primary
  cross-harness alignment metric.
- Preserve `measurement_divergence_pct` as an exact compatibility alias so
  existing Hyperloom integrations continue to work without changes.
- Add structured baseline alignment results:
  - `aligned` when same-config divergence is within tolerance;
  - `warning` when it exceeds tolerance;
  - `unavailable` when no valid same-config reference is provided.
- Keep alignment status independent from the optimization result status. A
  measurement warning does not automatically change an `ok` result.
- Add deterministic report post-processing that:
  - presents the same-config comparison first;
  - marks raw-session divergence as audit-only;
  - explains that it may include previously accepted configuration gains;
  - remains idempotent across recovery and repeated emission.
- Validate baseline inputs before serialization and treat non-finite values as
  unavailable.
- Restrict generated report updates to files inside the run's `eval_dir`.
- Update the external interface schema, documentation, CI handoff fixture, and
  workflow reporting guidance.

## Compatibility

No Hyperloom changes are required.

`measurement_divergence_pct` retains its existing same-config semantics, while
the ambiguous raw-session field is replaced with the explicit
`raw_session_baseline_divergence_pct` name.

The result schema is updated to version 2. The kernel journey schema remains
unchanged.

## Validation

- `interface/test_run_e2e_alignment.py`: 17 passed, 1 skipped.
- `interface/test_run_e2e_recovery.py`: 32 passed.
- Full `interface/` suite: 49 passed, 1 skipped.
- Updated `handoff.dry.json` completed `--dry-run` successfully.
- Repository search confirmed that the old key has no production-code
  references.

The skipped test requires a real session fixture that was not available in the
test environment. It is a pre-existing environment dependency and is unrelated
to this change.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9b49eafe6c0d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.