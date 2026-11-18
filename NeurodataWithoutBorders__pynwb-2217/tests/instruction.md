# Issue

**Title:** Allow latest linkml/linkml-runtime and require dandi>=0.76.5

## Description

## Motivation

 has been merged and released in dandi 0.76.5, lifting dandi's `click<8.2` bound. That bound previously conflicted with the `click>=8.2` requirement of linkml 1.11 when the `termset` and `docs` stacks were installed together in the gallery environment, which is why the `linkml`/`linkml-runtime` extras were capped at `<1.11`.

## Changes

- `pyproject.toml`: remove the `<1.11` cap on the `linkml` (`>=1.5.0`) and `linkml-runtime` (`>=1.5.5`) termset extras and drop the obsolete explanatory comment.
- `pyproject.toml`: bump the `dandi` docs dependency from `>=0.46.6` to `>=0.76.5`.
- `environment-ros3.yml`: pin dandi to `0.76.5`.
- `CHANGELOG.md`: add an entry under 4.0.1 (Unreleased).

## Testing

Verified the previously conflicting resolution in a fresh conda env (`python=3.13`) by running the documented docs install, `pip install --group docs ".[zarr,termset]"`:

- Resolves with `dandi 0.76.5`, `linkml 1.11.1`, `linkml-runtime 1.11.1`, and `click 8.4.2` (satisfies linkml 1.11's `click>=8.2`).
- pynwb wheel builds and installs; `pynwb`, `linkml`, `linkml_runtime`, `dandi`, `click` import.
- `pip check` reports no broken requirements.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e3127b23f2f8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.