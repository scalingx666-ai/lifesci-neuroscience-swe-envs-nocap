# Issue

**Title:** Bump versions to 0.3.0

## Description

Release prep for 0.3.0, shipping today. No functional change.

### Version

0.3.0 rather than 0.2.4, because two merged PRs change results rather than just adding to them:

- #226 shifts `Haufe2011Eeg` event timings, changes `Cattan2019Passive` durations, rescales `MartinezCagigal2023*` to volts, and doubles `num_timelines` for the three `Lee2019Eeg*` studies — users must delete `timelines.csv` to pick it up.
- #234 makes `reaction_time` numbers incomparable with earlier runs.

### CHANGELOG

New 0.3.0 section covering all 24 PRs merged since `v0.2.3`, verified by cross-checking PR numbers against `git log v0.2.3..HEAD`. Also adds the **0.2.2 and 0.2.3 sections, which were never written** (#216 bumped versions without touching the changelog), reconstructed from commit history.

Every entry is kept to three rendered lines or fewer; the migration-critical details (cache deletions, the radians conversion factor, the incomparability warnings) are preserved.

Three fixes found while doing this:

- Four entries under `[Unreleased]` (#194, #157, #105, #118) had in fact shipped in 0.2.3 — moved.
- Two entries cited **#205, which was closed unmerged**; the work landed as #234.
- The MOABB entry cited no PR at all — added #226.

### Sibling dependency pins

`neuralbench` declared `neuralset` and `neuraltrain` with **no version constraint at all**, and `neuralfetch` had `neuralset>=0.0.1`. A published `neuralbench` could therefore resolve arbitrarily old siblings, and a partly-failed upload would produce an installable but broken release. All sibling deps are now `~=0.3.0`, which accepts the whole `0.3.x` line but refuses `0.4.0`.

These pins cannot be split from the version bump: with pins at `~=0.3.0` and versions still at `0.2.3`, CI's single-pass editable resolution fails outright.

One consequence for the upload itself — the four packages must now go up in dependency order (`neuralset` + `neuraltrain`, then `neuralfetch`, then `neuralbench`), since `pip install neuralbench==0.3.0` stays broken until its siblings are on PyPI.

### docs/conf.py

`release` was hardcoded to `"0.1"`, stale since the 0.1.x line. It now reads from package metadata so it cannot drift again.

### Verification

`ruff check` and `ruff format --check` pass. All 8 artifacts (4 wheels + 4 sdists) build and pass `twine check`, and a dry-run resolution of the full 186-package graph confirms the four siblings resolve to the local 0.3.0 wheels rather than PyPI's 0.2.3.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0ad1047829a1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.