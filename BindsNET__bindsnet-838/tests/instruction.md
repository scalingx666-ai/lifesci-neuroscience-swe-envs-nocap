# Issue

**Title:** ci(dependabot): bump pyproject.toml only when a version leaves its range

## Description

Routine Dependabot updates raised the lowest allowed versions in `pyproject.toml` (for example `pandas>=3.1.0` to `>=3.1.1` in #836). The weakened-tests guard flags every `pyproject.toml` change, so each such update needed the `tests-changed-ok` label.

This sets `versioning-strategy: increase-if-necessary` for the pip ecosystem. Updates that fit the existing range now change `poetry.lock` only. Updates outside the range (major versions) still edit `pyproject.toml` and still get the guard's review, which is wanted for majors. A side benefit is that the floors users see stop rising on every patch release.

Not verified yet: GitHub's docs list `pip` (which covers Poetry) as supporting `versioning-strategy`, but they do not show an example for Poetry with a PEP 621 `[project]` table. Next Monday's Dependabot run will show it.

## AI assistance
- [ ] No AI tools were used
- [X] AI tools were used, and I (a human) have read every changed line

Tools used and for which parts: Claude Code (Claude Opus 5.5) wrote the change and this description.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3a4cdfa85291`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.