# Issue

**Title:** [FIX] Don't warn about the internal Dataset in Studyset.from_sleuth

## Description

No issue filed.

`convert_sleuth_to_nimads_dict`, which `Studyset.from_sleuth` calls, builds a `Dataset` only as an intermediate, but did not wrap it in `_quiet_dataset_deprecation()` as `convert_sleuth_to_studyset` already does. Every `Studyset.from_sleuth` call therefore emitted the `Dataset` deprecation `FutureWarning`. With the default `target=None` it also emitted "No mask or target space specified. Masker will be None, and Dataset space will be undefined". Both refer to an object the caller never sees; the resulting Studyset has its own target and masker.

Changes proposed in this pull request:

- Quiet the deprecation notice and the "No mask or target space specified" warning around the intermediate `Dataset` in `convert_sleuth_to_nimads_dict`.
- Add a test that `Studyset.from_sleuth` emits neither warning.

Merge note: this PR and #1171 both append a test to the end of `nimare/tests/test_sleuth_conversion.py`, so whichever merges second needs a trivial rebase.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Summary by Sourcery

Suppress warnings from the intermediate Dataset created during Sleuth-to-Studyset conversion.

Bug Fixes:
- Prevent `Studyset.from_sleuth` from emitting deprecation and undefined-space warnings for its internal intermediate `Dataset`.

Tests:
- Add coverage verifying that `Studyset.from_sleuth` emits neither internal `Dataset` warning.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0ef58fd51958`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.