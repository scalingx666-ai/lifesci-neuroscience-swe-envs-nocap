# Issue

**Title:** Fix baseline double-counting when mapping artefact events to samples

## Description

.

`badsamples` added `trialonset + time(this)`, but `time(this)` already includes the peristimulus `timeOnset`, whereas detector event times are stored relative to trial onset without it. The onset offset was counted twice, shifting every bad-sample window by the baseline length (`timeOnset*fs` samples) on epoched data.

This uses the trial-relative offset `(0:nsamples-1)/fsample` instead of `time(this)`. Behaviour is identical when `timeOnset == 0` (continuous data, or epochs with no baseline); the spurious shift is removed otherwise.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `530ec5271b22`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.