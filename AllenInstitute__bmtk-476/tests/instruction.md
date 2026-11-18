# Issue

**Title:** DPointNet: simplify EMD and consolidate NEST state wrappers

## Description

## Summary
, rebased onto its upstream squash merge (`c1ec46cb`). This is a scoped simplification, not the separate NEST/best-practice defaults migration.

- Retain one stable grouped EMD implementation with a canonical-order analytic VJP; remove the TensorArray loop and duplicate Javier implementation while retaining attribution.
- Consolidate duplicated base/history NEST wrappers into one implementation. Preserve coefficient layouts, live type-identity checks/fallback, path-specific CUDA capability checks, static type-indexed history specialization and reset/event gradients.
- Share boolean/auto option validation without changing retained option contracts.
- Consolidate overlapping EMD tests around real-constructor TensorFlow and independent NumPy FP64 value/VJP oracles, including unequal groups, ties, dtype and nonunit cost. Add an independent history-dtype/VJP regression.

Net reduction: **504 production Python lines (2.56% of DPointNet Python)** and **52 test Python lines**. This is a first simplification slice, not a completed repository-wide test audit.

## Configuration migration
Remove these retired keys; supplying them raises an explicit error:
- `use_grouped_custom_gradient`
- `use_javier_grouped_emd`
- `use_unity_lr_scale_fastpath`

EMD always uses the retained stable grouped VJP; cost, grouping, initial distribution and evaluation-scoped deduplication remain unchanged. Numerical equivalence is tested; bitwise equivalence to the old loop is not promised.

Forward and FP32-adjoint learning-rate scaling always retain the original multiplication, including `lr_scale=1`. An attempted automatic identity bypass failed strict FP16 rollout equivalence and was removed entirely, not enabled by default. No tolerance was relaxed.

**Dynamics, precision, acceleration and training defaults are unchanged. No CUDA/ABI changes; no environment or historical-run migration.**

## Validation
Exact final source, matching operators and import provenance verified. Rebase preserved the tested Git tree exactly.
- RTX3090 / SM86, TensorFlow 2.21 / CUDA 12.9: **421 focused passed**, **2,090 full passed / 28 skipped**, 2,118 collected, no failures.
- CPU / Keras 3: **1,307 passed / 811 skipped**.
- Actual Python 3.8 / TensorFlow 2.13 / Keras 2: **1,307 passed / 811 skipped**.
- Independent numerical oracles, reset/event/history/layout/rollout coverage, source/operator hashes, Python compilation and whitespace checks passed.
- Public `fused_nest_state` signature/defaults are unchanged.

Earlier RTX8000 run exposed two FP16 NEST rollout failures from the attempted unity bypass (not OOM). Paired baseline/candidate/forced-original-multiply controls reproduced and isolated the regression on RTX3090. The corrected final source passes both cases and the complete SM86 suite; **the corrected source has not been rerun on SM75**. Failed artifacts were preserved. No broader hardware qualification or convergence claim.

A separate component qualification showed the specialized small-batch CSR backward remains useful for dense paired cases, so it is retained rather than incorrectly retired.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c1ec46cb1c82`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.