# Issue

**Title:** feat: make main functions' arguments keyword-only with deprecation wrapper

## Description

## Summary
Converts `detect.main()`, `classify.main()`, and the root `main()` to
keyword-only arguments with a `@deprecate_positional_args` decorator
for a 6-12 month grace period before hard removal.

## Changes
- `cellfinder/core/tools/tools.py`: added reusable `deprecate_positional_args` decorator
- `cellfinder/core/detect/detect.py`: keyword-only signature + decorator applied
- `cellfinder/core/classify/classify.py`: keyword-only signature + decorator applied
- `cellfinder/core/main.py`: keyword-only signature + decorator applied; internal `classify.main()` call updated to keyword args
- `benchmarks/detect_and_classify.py`: updated to keyword args
- `tests/core/test_integration/test_detection.py`: updated to keyword args
- `tests/core/test_integration/test_detection_structure_splitting.py`: updated to keyword args

## Deprecation Approach
A `@deprecate_positional_args` decorator wraps each function. If a caller
passes positional arguments, the decorator:
1. Maps positional values to their corresponding keyword parameter names via `inspect.signature`
2. Emits a `DeprecationWarning` with `stacklevel=2` and mentions the 6-12 month grace period
3. Forwards everything as `**kwargs` to the keyword-only inner function

This ensures no abrupt `TypeError` for existing callers during the grace
period. Removal is as simple as deleting the decorator after 6-12 months.

## External Repos Checked
- `brainglobe-workflows` (brainmapper CLI): checked for positional calls , none found

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `98c0daa96469`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.