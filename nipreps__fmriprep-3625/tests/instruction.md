# Issue

**Title:** FIX: Reuse fewer config options when using `--config-file`

## Description

Addresses #3595

Some configuration options make reusing configuration files difficult, either due to:
- being set at run time, not when parsing arguments (`fmriprep_dir`, `log_dir`)
- not having off toggles (`anat-only`, `notrack`)

This is a smell, but rather than a big refactor this adds `config.default_reuse_skips()` which manually tracks them.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7252b41d9b3a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.