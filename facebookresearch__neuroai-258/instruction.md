# Issue

**Title:** neuralfetch: unify selective download (include/exclude), fold in #25

## Description

## Summary

Unifies **selective downloading** across every neuralfetch download backend behind two inherited glob fields on `BaseDownload` — `include` and `exclude` (dataset-relative POSIX globs; empty `include` means "everything", `exclude` is applied after and wins) — resolved through a single centralized matcher, `_selects()`. This completes the proposal in #257 (follow-up to the now-closed #51).

It also folds in and supersedes #25 (thanks @bpinsard) — his commits are **cherry-picked here with authorship preserved** — moving Datalad off `subprocess` onto the `datalad` Python API. As a natural consequence, a missing `datalad` install now **errors instead of silently warning and writing a bogus success marker over an empty folder**.

## What changed

- **`BaseDownload`**: new `include`/`exclude` fields, `_globs_match()` helper (openneuro-py glob semantics: `*`/`?`/`**`, folder patterns select their subtree), `_selects()` matcher, and `_reject_selection_filters()`.
- **Datalad / Gin**: fetch selected paths via `datalad.api` (built on @bpinsard's rewrite). Clone still lands in `download/<repo_name>/` (preserving existing study layout). `datalad` added to `requirements`. Gin keeps its git-annex web-URL registration, now driven by `include`/`exclude`.
- **Native pass-through**: `Openneuro` (`include`/`exclude`), `Huggingface` (`allow_patterns`/`ignore_patterns`). Removes the dead `Openneuro.excluded_patterns` field.
- **List/API filtering** through `_selects`: `S3`/`Physionet`, `Globus`, `Osf`, `Zenodo`, `Figshare`, `Dryad`.
- **No native filter**: `Dandi`, `Synapse`, `Eegdash`, `Donders` now raise `NotImplementedError` when `include`/`exclude` is set, instead of silently ignoring it.
- **Call sites**: `hebart2023things` migrated from `folders=[Wildcard("sub-*")]` to `include=["sub-*"]`; the existing `include=` study call sites are unchanged.

## Tests

- Matcher unit tests (`_globs_match` / `_selects` precedence).
- Per-backend selection wiring (`S3._resolve_prefix`, `Datalad._selected_paths`, `Gin` end-to-end).
- `NotImplementedError` for the unsupported backends.
- Regression: `download()` never writes a success marker when `_download` raises, and a missing `datalad` install leaves the folder empty (neuroai#51).

All of `test_download.py` passes; `ruff`, `ruff-format`, and `codespell` are clean.

## Issues

-
- Supersedes #25 (its commits are included with credit to @bpinsard — this PR can replace it)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `27aec3e305e3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.