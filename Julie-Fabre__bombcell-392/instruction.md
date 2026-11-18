# Issue

**Title:** Read NP2 AP gain from ap.meta instead of hardcoding to 80

## Description

.

- `loading_utils.py/get_gain_spikeglx()` now prefers `imChan0apGain` from the meta file. It falls back to per-subtype defaults (80 for type-21/24 alpha probes, 100 for commercial NP2s and unrecognized probes) when that field doesn't exist.
- Extends NP2 type list with remaining subtypes from Bill Karsh's ProbeTable repo: 2005, 2006, 2021, 2022, 2300.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4f598709e7cd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.