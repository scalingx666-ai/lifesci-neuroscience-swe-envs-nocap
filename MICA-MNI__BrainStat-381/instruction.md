# Issue

**Title:** Resolve last two open issues: #199 (mypy) and #342 (volumetric)

## Description

## Summary

Closes the last two open issues that weren't resolved by #378 / #379 / #380.

###  — Remove ``# type: ignore`` from SLM class

`SLM.py` and `_multiple_comparisons.py` had file-level `# type: ignore` shebangs because mypy crashed on the in-class `from ._linear_model import _linear_model` pattern (the original blocker, ). Move those imports to module level and bind the functions as class attributes (`_linear_model = _linear_model`, etc.). Mypy now runs to completion on both files instead of crashing.

The pre-existing untyped-code errors that the file-level ignore was hiding (~380 of them, mostly around `Optional` access without narrowing) are now surfaced but **left to a follow-up PR** — fixing them is genuinely a separate piece of work and re-enabling the commented-out `mypy` job in CI before that triage would just produce noise.

###  — Volumetric mixed effects

The reports on this issue all converged on the same two contract bugs in volumetric workflows:

1. **`contrast` dtype**: pandas Series of object/categorical dtype was preserved through `np.array(contrast)`. Downstream `np.dot` then raised `TypeError: can't multiply sequence by non-int of type 'float'`, or (worse) the run silently produced all-NaN t-values. Now coerced to numeric in `__init__`, with a clear `TypeError` if conversion fails.
2. **`mask` dtype**: integer 0/1 masks (the natural shape of `nib.load(...).get_fdata().astype(int)`) caused `_fdr` to do fancy indexing instead of boolean masking, producing the well-known `shape (126006,) could not be broadcast to indexing result of shape (1082035,)` error. Now coerced to bool in `__init__`.

Also reworded the `surf=None + correction='rft'` error so it explicitly points users at `correction='fdr'` for volumetric data — the previous "RFT corrections require a surface" message read as a dead-end.

The hard part of #342 — implementing **cluster-level RFT/TFCE for volumes** — is genuinely out of scope; SurfStat had it but BrainStat's port doesn't, and a faithful re-port would be a multi-week project. That's flagged in the new error message and remains tracked. What this PR does fix: every `SLM(...)` invocation pattern that the issue reporters posted now runs end-to-end.

## Test plan

Four new tests in `brainstat/tests/test_SLM.py`:
- `test_volumetric_contrast_coercion` — pandas Series → float; object dtype rejected with helpful message.
- `test_volumetric_int_mask_is_coerced_to_bool` — int 0/1 mask becomes a boolean mask.
- `test_volumetric_rft_without_surface_explains_alternatives` — error message mentions FDR.
- `test_volumetric_fdr_with_int_mask_runs_end_to_end` — the full reporter scenario (int mask + pandas contrast + FDR) returns finite t-values inside the mask and a Q-array of the right shape.

Locally: 73/73 SLM + t_test + FDR + f_test cases pass.

## Out of scope (kept open as separate trackers)

- The 383 pre-existing typing errors that the file-level `# type: ignore` was hiding — straightforward but noisy cleanup.
- Volumetric cluster-level RFT/TFCE (the ambitious half of #342).
- Re-enabling the commented-out mypy job in `python_unittests.yml` once the typing errors are triaged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b588136f9c1b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.