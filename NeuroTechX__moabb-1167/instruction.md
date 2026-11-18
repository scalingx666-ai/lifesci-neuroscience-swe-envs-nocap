# Issue

**Title:** Pre-release 1.6.1

## Description

Bug-fix release.

### Version
`moabb.__version__` 1.6.1dev0 → **1.6.1**, propagated to `CITATION.cff` (+ `date-released: 2026-08-27`), `README.md` and `docs/source/cite.rst`. All five citation surfaces verified equal at 43 authors; `CITATION.cff` validates with `cffconvert`. The author list is unchanged — every entry in this release is by an existing author.

### Changelog
`Version 1.6.1 (Source - GitHub)` → `(Stable - PyPi)`, and a fresh `Version 1.7 (Source - GitHub)` section opened.

### What is in it

| | |
|---|---|
| #1161 | `BNCI2025_001` label leakage — 7 kinematic channels (target position, hand velocity) were typed `eeg` and picked as classifier features |
| #1161 | The `Rodrigues2017` / `Cattan2019_PHMD` / `Cattan2019_VR` montages :gh:`700` announced and never implemented |
| #1161 | `Cattan2019_PHMD` `interval` described 60 s relaxation blocks as 1 s |
| #1161 | NEMAR prefetch trusted any non-empty store, so a per-subject caller silently reached the upstream host |
| #1161 | `import moabb` mutated the caller's global matplotlib rcParams |
| #1161 | The monthly download job ran `pytest download.py` — a file that does not exist — and had failed every month since March |
| #1166 | `AcquisitionMetadata.n_channels` derived from `channel_types` instead of stored beside it; 34 datasets disagreed with themselves |

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8d3c12db1e12`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.