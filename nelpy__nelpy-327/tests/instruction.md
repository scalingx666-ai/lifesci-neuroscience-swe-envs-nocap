# Issue

**Title:** Fix step-only analog signal construction

## Description

## Summary
- Reject `step` when `AnalogSignalArray`/`RegularlySampledAnalogSignalArray` construction would otherwise infer default abscissa values.
- Keep `fs` as the supported way to infer regular abscissa values.
- Preserve legacy `step` behavior for explicitly provided `abscissa_vals`, where it controls contiguous support segmentation.

## Root Cause
`rsasa_init_wrapper` generated default abscissa values from `fs` before the core constructor stored `step`. As a result, `step` appeared accepted but did not define the inferred abscissa values, producing misleading integer-spaced timestamps and fragmented support.

## Validation
- `.\\.conda\\python.exe -m pytest tests/test_AnalogSignalArray.py`
- `.\\.conda\\python.exe -m ruff check nelpy/core/_analogsignalarray.py tests/test_AnalogSignalArray.py`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3f2c513a8133`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.