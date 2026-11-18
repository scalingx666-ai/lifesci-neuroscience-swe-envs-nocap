# Issue

**Title:** FIX MIND2026: ScienceDB getZipFile version V3 -> V4 (V3 404s)

## Description

ScienceDB has removed the `V3` release of this archive; `version=V3` now returns 404 on every fetch, so every fresh `MIND2026` download fails immediately.

`version=V4` is the current replacement, verified live on 2026-10-05 from a login-node `curl -sk -D -` HEAD request:

| version | HTTP | content-length |
|---|---|---|
| V3 | 404 | 0 |
| V4 | 200 | 74,409,645,600 |

`74,409,645,600` bytes (~74.4 GB) matches this loader's own docstring estimate ("~74 GB") almost exactly, confirming V4 is the correct current successor release, not a different/incompatible one.

The synthetic regression test (`test_large_motor_regression.py`) mocks `mind2026.dl.data_dl` via `monkeypatch` and never touches the real URL, so it is unaffected by this change; re-ran it locally (`pytest -k mind2026`), still passing. `pre-commit` clean on the two changed files (`moabb/datasets/mind2026.py`, `docs/source/whats_new.rst`).

Not merging this myself.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a2180fabb493`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.