# Issue

**Title:** ENH add critical difference benchmark plot

## Description

.

Add `plot_critical_difference` for comparing pipelines across complete multi-dataset benchmarks.

## Statistical contract

- Rank pipelines within each dataset and compare those complete dataset blocks with Friedman + Nemenyi (Demšar, 2006).
- Macro-average repeated rows within session, then sessions within subject, then subjects within dataset; no subject/session receives extra weight merely because it produced more rows.
- Require the same compared pipelines on every dataset and the same subject/session coverage within each block.
- For learning-curve results, require one fixed `data_size`; at that size every pipeline must contain the same permutation identities in each repeated-measurement block.
- Validate raw selected scores as numeric and finite **before aggregation**, so NaNs cannot disappear through pandas `.mean()`.
- If `pipelines=[...]` selects a subset, completeness/protocol/finite-score validation is scoped to that subset; unrelated rows outside the requested comparison do not poison it.
- Reject mixed evaluation protocols, missing benchmark identity, missing requested pipelines, and incomplete blocks rather than silently changing the estimand.
- Support higher-is-better and lower-is-better metrics.

The diagram shows mean ranks, the Nemenyi critical-difference scale, and maximal contiguous groups whose mean-rank separation does not exceed the CD.

## Validation

Focused regressions cover:
- canonical Demšar numeric CD (`k=4, N=14, alpha=.05 -> CD≈1.25`);
- subject-balanced/session-balanced aggregation;
- unequal repeat counts within sessions;
- missing session and missing permutation coverage;
- mixed learning-curve `data_size` values;
- raw non-finite scores that would otherwise be silently skipped by aggregation;
- unselected bad pipelines not contaminating a requested subset;
- incomplete dataset×pipeline and subject sets;
- mixed/missing evaluation identity;
- identical-pipeline Friedman degeneracy;
- explicit two-pipeline rejection.

Current head `bac7b41411b3` is mergeable and `pre-commit.ci - pr` is green. Upstream GitHub Actions for external contributions remain maintainer-gated.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9c6b1ccfa94c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.