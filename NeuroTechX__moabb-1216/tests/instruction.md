# Issue

**Title:** DOC: make _corrected_resampled_ttest docstring raw (restores \frac after #1204)

## Description

. The merged head kept four `\frac` in a non-raw docstring; Python decodes `\f` as a form feed, so `ast.get_docstring` showed 4 form feeds and 0 `\frac`, and Sphinx rendered the equation without its fractions. Making the docstring raw (`r"""`) keeps the single-backslash LaTeX @qbarthelemy intended and removes the whole class of pre-commit/escape interactions. Verified: 0 form feeds, 4 `\frac`, 1 `\sqrt` at runtime. No changelog entry (doc-only).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3381c7e79d16`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.