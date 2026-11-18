# Issue

**Title:** neuralfetch: bump openneuro-py floor to >=2026.7.1

## Description

## Summary

Bumps the `openneuro-py` floor to `>=2026.7.1`, which  (large OpenNeuro studies stalling under a connection leak + retry storm).

The root cause was **upstream**: older `openneuro-py` created a new `AsyncClient` per file, so open TCP connections scaled with *file count* rather than `max_concurrent_downloads` (measured >2,300 connections on `ds007523`). Two upstream releases fix this:

- **`2026.7.0`** —  (fixes ). Open connections are now bounded by the pool size, not the number of files.
- **`2026.7.1`** — , which addresses the retry-storm symptom directly.

Pinning `>=2026.7.1` picks up both.

## Changes

Pin the floor in the two places that matter, and consolidate the requirement at the downloader level:

- `neuralfetch-repo/pyproject.toml`: `openneuro-py>=2026.4.0` → `openneuro-py>=2026.7.1` (the **install floor** for the `quickstart`/`all` extras).
- `neuralfetch/download.py` (`Openneuro` backend): `requirements = ("openneuro-py>=2026.4.0",)` → `("openneuro-py>=2026.7.1",)` (the **runtime import guard** / copy-pasteable `pip install` hint, inherited by every OpenNeuro-backed study).
- Removed the now-redundant **per-study** `openneuro-py` declarations:
  - `studies/bel2026petit.py` — dropped `requirements = ("openneuro-py",)` (empty → default).
  - `studies/chang2019bold5000.py` — dropped `requirements = ("openneuro-py>=2025.2.0",)`.
  - `studies/li2022petit.py` — `("openneuro-py", "praatio")` → `("praatio",)` (keeps its praatio requirement).

### Why consolidate at the downloader level

`openneuro-py` is an **optional** dependency (in the `quickstart` extra, not core), so a bare `neuralfetch` install doesn't pull it. `_check_requirements` runs at download time and emits a friendly `pip install ...` hint if it's missing. This check runs on the **backend** (`BaseDownload.download` → `Openneuro.requirements`) for every study that uses the downloader, so declaring `openneuro-py` on individual studies was redundant and inconsistent (only 3 of 7 OpenNeuro-backed studies did it). Declaring it once on the `Openneuro` backend covers them all uniformly.

Note: `_check_requirements` only gates *importability* (not the version); the version floor is enforced by the `pyproject.toml` dependency.

## Notes

- Distinct from the selective-download work (#257); the `include=`-scoping path referenced in #182's workaround is tracked separately under #51.
- The full `Bel2026PetitListen` study (~446 GB) still exceeds typical Colab/VM disk regardless of this fix, so it remains a cluster/large-disk job.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1fe49934e701`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.