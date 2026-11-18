# Issue

**Title:** FIX: accept ASCII uV channel units

## Description

Accept ASCII `uV` as an alias for the BIDS microvolt unit `µV` when reading `channels.tsv`. Adds coverage alongside the existing `rad` round-trip.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e8ed8ad174bf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.