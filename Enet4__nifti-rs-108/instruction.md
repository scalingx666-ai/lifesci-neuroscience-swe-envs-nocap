# Issue

**Title:** Update CI

## Description

- use actions/checkout v4
- replace Rust actions with actions-rust-lang/setup-rust-toolchain

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a3267fadbfbf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.