# Issue

**Title:** fix: stabilize compiled capture and compare vLLM identities

## Description

## Summary

- Replace per-call compiled passthrough counting with a stable observation marker so Dynamo can reuse a fullgraph capture.
- Compare complete parsed vLLM launch records symmetrically; report one-sided fields as mismatches while preserving subset comparison for partial caller identities.

## Test plan

- `python -m pytest -q e2e_workflow/scripts/tests/test_capture_shapes.py e2e_workflow/scripts/tests/test_capture_shapes_compiled.py e2e_workflow/scripts/tests/test_kernel_selection.py interface/test_run_e2e_alignment.py` (256 passed, 53 subtests passed).
- GEAK L0 Python tests (182 passed), Node regression, and handoff dry-run passed.
- Local compile validation used PyTorch 2.14.1 CPU. PyTorch 2.12 / ROCm validation remains outstanding.

## Related issues

-
- Follow-up to

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ab1925d6afac`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.