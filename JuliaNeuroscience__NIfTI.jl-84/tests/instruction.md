# Issue

**Title:** CI: fix macOS arch for Apple Silicon runners

## Description

`macOS-latest` GitHub runners are now Apple Silicon (arm64). `setup-julia@v3` errors when `arch: x64` is requested on them, so the macOS jobs fail.

This configures the matrix to use the correct native architecture (default per-runner for single-arch matrices; explicit `exclude`/`include` for multi-arch matrices) and bumps `julia-actions/setup-julia` to v3.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `12ad63c0e462`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.