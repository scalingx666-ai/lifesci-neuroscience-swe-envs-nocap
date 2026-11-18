# Issue

**Title:** fix: correct loader param name, path assignment, and spelling in docs

## Description

## Fix: Documentation & Example Corrections

### Changes
- Fix incorrect kwarg name in VIA-tracks loader examples
- Fix swapped frame/video path assignments in docstring
- Fix spelling error in bbox example

### Files Changed
- `docs/source/user_guide/input_output.md`
- `movement/sample_data.py`
- `examples/load_and_upsample_bboxes.py`

### Type of Change
- [ ] Bug fix (non-breaking)
- [x] Documentation/Examples improvement

### Testing
Ruff linting: ✅ passed
Changes are documentation/examples only (no runtime logic affected).

Fixes copy-paste errors for new users learning the loader API.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dc95dddcf7ee`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.