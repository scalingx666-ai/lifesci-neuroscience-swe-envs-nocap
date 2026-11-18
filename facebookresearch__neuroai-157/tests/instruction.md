# Issue

**Title:** Fix MNE sample-data re-downloads in Mne2013Sample/Fake2025Meg

## Description

---

`Mne2013Sample`/`Fake2025Meg` resolved the MNE sample dataset through three different roots, so `download()` then `run()` re-downloaded the 1.65 GB dataset twice (3 copies, ~4.7 GB). Two related bugs on the same paths are fixed too:

- `run()` showed **no download progress bar** (`verbose=True` was only in `_download()`).
- `run()` then `download()` crashed with `RuntimeError: ... instance was frozen`.

## Changes

- **`mne2013sample.py`**: funnel `_download`, `iter_timelines`, `_get_data_path`, and `_load_timeline_events` through one `_download_root()`/`_mne_data_path()` helper (anchored on `<self.path>/download`, `verbose=True`). Drops the `CACHE_FOLDER` special-case and fallback.
- **`study.py`**: `download()` now tolerates a frozen instance (after `run()`) instead of crashing — `path` is excluded from the cache UID, so it's safe. Additive; download-first flow unchanged.
- **Tests**: mocked single-root/progress-bar test (no network), plus a frozen-instance `run()`→`download()` test.

Result: every order yields one copy, shows the progress bar, and never crashes.

## Test

```bash
pytest neuralset/events/testing/test_mne2013sample.py neuralset/events/test_study.py::test_download_after_run_does_not_crash_when_frozen
```

## What I learned

Tracing this bug taught me a lot about how `neuralset` and `neuralfetch` are wired — the `Study` download/path lifecycle, the per-study `self.path`/`download/` convention shared across studies, and how `exca` freezes a model after `run()`. That context is what made the root cause and the right-sized fix clear.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `850801d8dc28`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.