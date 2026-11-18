# Issue

**Title:** neuralfetch(bug): keep Ghassemi2018You annotations on the record's time axis

## Description

## What does this PR do?

`Ghassemi2018You._load_sleep_events` subtracted the onset of the first annotation from every annotation, assuming annotations start at time 0. Challenge 2018 scoring starts minutes into each record, so every stage and arousal, and the first N2 that `AddSleepOnsetTargets` derives, was shifted earlier by a record-specific lead-in (tr03-0005: N2 at 420 s instead of 780 s). This keeps the WFDB sample index / fs as the start time and adds a regression test on a synthetic `.arousal` file whose first annotation is at 360 s; the test fails on `main` and passes here.

## Related Issues

 (reported by myself)

## Checklist

- [x] Tests added or updated
- [ ] Docstrings updated for any changed public APIs (no public API changed)
- [x] `pytest` and `mypy` pass locally (`pytest neuralfetch`: 97 passed; `mypy` shows only the pre-existing `neuralset.*` import-not-found errors of a non-strict editable install, same as on `main`)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2906ffcf2fa2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.