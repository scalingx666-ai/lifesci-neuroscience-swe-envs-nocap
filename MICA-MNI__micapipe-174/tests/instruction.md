# Issue

**Title:** Add dcm2niix to comprehensive base image

## Description

## Summary
- Install `dcm2niix=1.0.20240202` (conda-forge) into the `micapipe` conda env in `Dockerfile.mamba-base`, in its own layer right after MRtrix3.
- , which introduced `Dockerfile.mamba-base`. Server-side verification on `bb-compxg-01` against `ghcr.io/mica-mni/micapipe-comprehensive-base:latest` showed the binary is missing (`which dcm2niix` empty; `find /opt -name dcm2niix` no result), causing the explicit dependency check in `micapipe` (`Check your dcm2niix installation`) to fail and blocking any pipeline that calls `dcm2niix` (also required by `functions/mic2bids`).

## Why this base
This PR is stacked on `enning/comprehensive-cleanup` (the head of #173) because `Dockerfile.mamba-base` only exists on that branch. Once #173 merges to `v1`/`master`, this branch can be retargeted to `master` with no diff churn — the change is a pure addition.

## Notes
- Pinned version matches the recent upstream tag (`v1.0.20240202`, https://github.com/rordenlab/dcm2niix). Bump as needed.
- `Dockerfile.main` (slim layer) was intentionally not modified.
- The `micapipe` env is auto-activated at runtime via `BASH_ENV=/etc/bash.bashrc`, so the new binary lands on `PATH` for the dependency check at `micapipe:678` and for `functions/mic2bids`.

## Test plan
- [ ] Rebuild `micapipe-comprehensive-base` from this branch (45–60 min on the build server) — not done locally as requested.
- [ ] In the rebuilt image: `which dcm2niix` resolves and `dcm2niix -h` prints help; `find /opt -name dcm2niix` returns the conda env binary path.
- [ ] Re-run a sample `micapipe` invocation that previously errored with `[ ERROR ]..... Check your dcm2niix installation` and confirm the dependency check passes.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `03e02e2d178a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.