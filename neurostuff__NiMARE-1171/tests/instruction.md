# Issue

**Title:** [FIX] Accept path-like Sleuth files in convert_sleuth_to_nimads_dict

## Description

No issue filed; found while writing the test for #1169.

`convert_sleuth_to_nimads_dict` (and so `Studyset.from_sleuth`) is documented and annotated to accept "`str`, `pathlib.Path`, or sequence of such", but it passed the argument straight to `convert_sleuth_to_dataset`, which accepts only a `str` or a `list`. A `Path` or a tuple raised "Unsupported type for parameter 'text_file'". A list of `Path`s already worked.

Changes proposed in this pull request:

- Normalise path-like objects and sequences to `str`/`list` at this entry point. The older converters keep their documented `str`/`list` contract.
- Add a parametrized test (`Path`, list of `Path`, tuple) that each gives the same NiMADS dict as a `str`.

Merge note: this PR and #1169 both append a test to the end of `nimare/tests/test_sleuth_conversion.py`, so whichever merges second needs a trivial rebase.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `171d769a2de5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.