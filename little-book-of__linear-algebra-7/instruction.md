# Issue

**Title:** v0.1.1 - Fix some Markdown math formulas

## Description

### Fixed

- Math rendering issues in GitHub (`cases` → `bmatrix`, escaped braces, removed blank lines in `$$ … $$`).
- Example 3.1.1 matrix equation formatting.
- Example 4.2.2 set notation braces.
- Clarified condition for orthogonal vector exercise.

### Improved

- Consistent formatting for systems, coordinate vectors, and solution types.
- GitHub-safe LaTeX rendering guidelines applied.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `116de9ca7394`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.