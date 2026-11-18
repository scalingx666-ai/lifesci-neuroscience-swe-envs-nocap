# Issue

**Title:** Improve cluster store

## Description

- [x] Custom loader in cluster store. Used for waveform loader.
- [x] Refactor waveform loader with cluster store
- [x] Don't regenerate the disk store at every load
- [x] Add several store items

. .

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7256b323372e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.