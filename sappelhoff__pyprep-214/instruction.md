# Issue

**Title:** Require MNE >=1.13, switch to spherical montages, and drop Python 3.10

## Description

# PR Description

Following MNE 1.13 deprecating and MNE 1.14 removing the legacy Colin27 `standard_*` montages (`standard_1005`, `standard_1020`), this PR:

- Bumps the minimum MNE version to `mne>=1.13.0` in `pyproject.toml`.
- Switches the test fixture and PREP pipeline examples from `standard_1005`/`standard_1020` to `spherical_1005` (and `spherical_1020` in the standalone RANSAC example). This resolves the 25 failing tests in scheduled CI against MNE development (`mne-main`).
- Drops Python 3.10 support (`requires-python = ">=3.11"`), retaining Python 3.11 through 3.14.
- Bumps pre-commit hooks (`ruff-pre-commit` to `v0.16.10`, `toml-sort` to `v0.25.0`) and updates the Python setup in `matprep_artifacts.yml` to `3.14`.
- Documents all changes in `docs/changelog.rst`.

# Merge Checklist

- [ ] the PR has been reviewed and all comments are resolved
- [ ] all [CI][what-is-ci] checks pass
- [ ] (if applicable): the PR description includes the phrase `closes #<issue-number>` to [automatically close an issue][auto-close-documentation]
- [x] (if applicable): the changes are documented in the changelog [changelog.rst][changelog]
- [ ] (if applicable): new contributors have added themselves to the authors list in the [`CITATION.cff`][citationcff] file

[what-is-ci]: https://help.github.com/en/actions/building-and-testing-code-with-continuous-integration/about-continuous-integration
[auto-close-documentation]: https://help.github.com/en/github/managing-your-work-on-github/linking-a-pull-request-to-an-issue#linking-a-pull-request-to-an-issue-using-a-keyword
[changelog]: https://github.com/sappelhoff/pyprep/blob/main/docs/changelog.rst
[citationcff]: https://github.com/sappelhoff/pyprep/blob/main/CITATION.cff

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2647bb1b9b67`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.