# Issue

**Title:** ENH: Allow top-level splitters in CrossSubjectEvaluation

## Description

.

`CrossSubjectEvaluation` currently hardcodes its top-level `CrossSubjectSplitter`, so a metadata-aware cross-subject protocol cannot reuse MOABB's caching, scoring, joblib parallelism, result database, and fold metadata handling without reimplementing the evaluation engine.

This PR adds an optional `splitter=` injection point for a scikit-learn `BaseCrossValidator` following MOABB's existing `split(y, metadata)` contract.

Design constraints:
- Default `CrossSubjectEvaluation` behavior is unchanged when `splitter=None`.
- An explicit top-level splitter is mutually exclusive with the existing top-level protocol controls (`cv_class`, `cv_kwargs`, `n_splits`, `groups`, and non-default `cs_mode`) so two protocol definitions cannot silently conflict.
- Splitter-declared `metadata_columns` are carried into result rows, and per-fold `get_metadata()` output goes through the existing evaluation task path.
- Train/calibration/test indices are consumed by the same fold engine as the built-in cross-subject protocols. Explicit splitters must yield exactly 2 or 3 slices with unique, in-range, one-dimensional integer **positions**; train/calibration/test slices must be pairwise disjoint, so malformed custom protocols cannot silently leak trials.
- The positional contract is explicit because the evaluator slices metadata with `iloc`; custom splitters must not rely on DataFrame index labels.
- Each explicit test fold must resolve to exactly one subject. MOABB stores one subject identity per result row, so accepting a multi-subject test fold would silently misattribute the scientific unit being evaluated.

- Splitter metadata is deep-copied at fold materialization time, so a custom splitter that reuses/mutates nested metadata objects cannot retroactively change earlier folds' recorded provenance.

Validation:
- Explicit splitter construction and protocol-conflict checks.
- Splitter metadata propagation.
- End-to-end fake EEG cross-subject evaluation through the real caching/scoring pipeline.
- Non-RangeIndex metadata regression proving that splitter outputs are interpreted as positions.
- Rejection of multi-subject test folds.
- Rejection of overlapping, duplicate, non-integer, out-of-range, and wrong-arity custom fold indices.
- Frozen-head focused validation on `4a01cb02` independently ran `uv run --no-sync python -m pytest moabb/tests/test_evaluations.py -q -k cross_subject_top_level_splitter` on Python 3.11 → **14 passed**, including the end-to-end fake-EEG evaluation and all malformed-fold contract checks ([run #37115116998](https://github.com/lindicaphxag-tech/lindicaphxag-tech/actions/runs/37115116998)).
- Pre-commit CI is green; repository GitHub Actions currently require maintainer approval for this external contribution.
## Scope boundary with grouped cross-subject CV

The explicit `splitter=` hook in this PR intentionally follows the **single-target** use case from #1104: a metadata-aware top-level splitter may exclude part of the held-out target subject (for example, test only one target session while dropping the target's other sessions), so each fold still has one target subject and one subject identity in the result rows.

This is distinct from the standard `cv_class` / grouped-CV path. Multi-subject test folds produced there are a valid separate use case; #1211 handles their result provenance by fitting once and scoring/storing each held-out subject separately. In other words, #1207 does not redefine grouped CV as single-subject-only; it keeps the new transfer/exclusion hook narrow to the issue that motivated it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c60f954bef9b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.