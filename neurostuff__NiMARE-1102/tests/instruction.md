# Issue

**Title:** [FIX] Keep assigned Studyset tables through projection rebuilds

## Description

## Summary

`Studyset.images = df` — which is how `ImageTransformer.transform` records the maps it derives — stored the new table only in the projection cache. `filter_ids` builds the derived Studyset with `_from_store`, which starts from an empty cache and reprojects from the immutable store, so the assignment was silently dropped by `slice`, `filter_study_ids` and `filter_annotations`, and by any execution-context change such as `update_path`.

`Jackknife._leave_one_out_values` refits on `estimator.dataset.slice(...)`, so **every leave-one-out refit lost every derived map** rather than only the analysis being left out. Dropping one of those analyses changed nothing, because all of them were already gone — which is why converted analyses produced byte-identical rows in `..._diag-Jackknife_tab-counts.tsv`.

On the IBMA test data (`test_pain_dataset`), with `ImageTransformer("z")`:

| | before | after |
|---|---|---|
| z maps supplied | 20 | 20 |
| z maps after `ImageTransformer` | 21 | 21 |
| z maps in each of the 21 refits | 19 (×20), 20 (×1) | 20 (×21) |

## Fix

Track caller-assigned tables alongside the projection cache and re-apply them whenever a projection is rebuilt, restricted to the IDs that projection selects, and carry them across `filter_ids` and `deepcopy`.

Rows the assignment does not cover keep their store-derived values, so analyses added after the assignment are unaffected. Coordinates are excluded because that setter redefines the ID space, which the store owns.

## Known remaining gap

Serialization (`to_dict`, `to_nimads`, `to_dataset`) reads the canonical store and so still drops assigned tables. Writing them back into the NIMADS graph is a larger change and is left out of this fix.

## Testing

- New regression test in `nimare/tests/test_nimads.py` covering `slice`, re-slicing a derived Studyset, `filter_study_ids` and `update_path`. It fails on `main` and passes here.
- Full suite green (706 passed, 2 skipped; `test_estimator_performance`, `test_extract` and `test_reports` excluded locally).

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Summary by Sourcery

Preserve assigned Studyset tables across projection rebuilds and derived Studyset operations.

Bug Fixes:
- Preserve caller-assigned Studyset tables, including derived image columns, when projections are rebuilt or filtered.
- Ensure derived Studysets and copied instances retain assigned tables across slicing, study filtering, annotation filtering, and execution-context changes.

Enhancements:
- Keep store-derived values for rows not covered by an assigned-table override while excluding coordinate tables from override tracking.

Tests:
- Add regression coverage verifying assigned image columns survive slicing, re-slicing, study filtering, and path updates.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `85c1fbc33507`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.