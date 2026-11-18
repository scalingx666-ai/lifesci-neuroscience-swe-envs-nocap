# Issue

**Title:** [FIX] Key get_analyses_by_metadata/annotations by full analysis id

## Description

No issue filed.

`Studyset.get_analyses_by_mask`, `get_analyses_by_coordinate` and `get_analyses_by_label` returned *short* analysis ids, and `slice()` expands a short id to every analysis that declares it. Short ids are only unique within a study: Neurosynth uses `"1"` for every analysis, and Sleuth imports use `analysis_1`. So selecting the analyses in a mask and slicing by the result could silently return unrelated analyses, or the whole database. On the bundled Laird subset, 6 analyses in the amygdala ROI became 17 after `slice`. The legacy `Dataset` docstrings already point users to these methods for "slicing-ready analysis IDs".

**Breaking change.** These methods now return full `"<study id>-<analysis id>"` ids, which makes each one return the same ids as its `get_studies_by_*` counterpart. The `versionchanged:: 0.22.1` notes assume the next release number; please adjust if it will be different.

Changes proposed in this pull request:

- Return full analysis ids from `get_analyses_by_mask`, `get_analyses_by_coordinate` and `get_analyses_by_label`.
- Key `get_analyses_by_metadata` and `get_analyses_by_annotations` by full id too (separate commit). They returned dicts keyed by short id, so when two studies shared a short id, one analysis's entry silently overwrote the other's.
- New tests use `selection_document()`, where `"plain"` exists in two studies: each helper must find exactly one analysis, `slice` must return exactly that one, and the dict helpers must keep both `"plain"` analyses.
- Update the existing short-id expectations in `test_a_hyphenated_short_analysis_id_is_looked_up_not_split` and `test_get_analyses_by_label`.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Summary by Sourcery

Use full analysis IDs throughout analysis-selection helpers to prevent cross-study collisions and unintended analysis selection.

Bug Fixes:
- Return full study-qualified analysis IDs from mask, coordinate, and label queries so their results can be safely passed to slicing without selecting unrelated analyses.
- Preserve separate entries for analyses sharing a short ID when querying metadata or annotations.

Tests:
- Add coverage for exact slice selection and preservation of analyses with duplicate short IDs across query helpers.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `171d769a2de5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.