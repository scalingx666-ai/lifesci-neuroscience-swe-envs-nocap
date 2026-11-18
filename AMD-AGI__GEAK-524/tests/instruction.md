# Issue

**Title:** e2e: confirm surprising speedups using candidate coverage

## Description

Whole-module kernel overlays can accelerate more paths than the selected head's profile share covers. The existing Amdahl guard could reject an accuracy-validated e2e gain as corruption and route it into correctness rewrites that repeatedly reused the same A/B evidence.

This change makes the estimate advisory and uses the candidate's affected kernel/shape/phase coverage when it matches the candidate, current reference, and workload. It accounts for per-path speedups and removed auxiliary kernels, preserves the head share for ranking, and labels uniform-speedup or head-only fallbacks explicitly.

Surprising accuracy-gated gains now request at most one independent A/B confirmation with fresh reference/candidate legs and at least two timed replicas per leg. A completed confirmation with matching provenance and passing correctness can be accepted above the estimate. Cached legs, changed identities, missing provenance, and incomplete reviews cannot certify a win or trigger a correctness rewrite. Existing confirmed evidence avoids another review.

The common integration path, per-measurement checkpoints, and Python recovery use the same review decision, so backend candidates retain separate evidence and recovery preserves confirmed or inconclusive reviews.

.

Validation:

- 13 new CPU-only Node regression tests pass, including the issue's 7.18% versus 12.02% coverage example and +7.72% gain.
- All 22 Node regression commands configured in CI pass; the new regression is wired into CI.
- 161 related Python recovery, margin, and checkpoint tests pass.
- Expanded Python checks: 655 passed and 42 subtests passed; one pre-existing failure in `interface/test_run_e2e_trace_mirror.py::test_a_copy_failure_is_recorded_and_the_pass_continues` (expected four recorded copy errors, got zero). The same failure reproduces on unmodified main at `02bfbb0b`.
- Workflow syntax and `git diff --check` pass. GPU e2e has not been run.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a0e2b9d0c31c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.