# Issue

**Title:** fix(docker): bump sglang to v0.5.11 and auto-resolve GPU arch

## Description

## Summary

- Bumps base image from `v0.5.9-rocm700` to `v0.5.11-rocm720` (aligned with Hyperloom). The old image shipped a stale `rocm.list` pointing at an internal Artifactory build that now 404s, breaking `apt-get update`.
- Adds `ARG BASE_IMAGE` to the Dockerfile so the base image can be overridden at build time.
- `run-docker.sh` now auto-detects the host GPU arch via `rocminfo` and selects the right base image: `gfx942` (MI300X/MI325X) → `mi30x`, `gfx950` (MI355X) → `mi35x`. Override with `BASE_IMAGE` env var if needed.

## Test plan

- [ ] `scripts/run-docker.sh --rebuild` on MI325X picks `mi30x` automatically
- [ ] `scripts/run-docker.sh --rebuild` on MI355X picks `mi35x` automatically
- [ ] `BASE_IMAGE=... scripts/run-docker.sh --rebuild` overrides auto-detection
- [ ] Docker build completes without apt-get errors

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3868b54e9691`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.