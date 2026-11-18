# Issue

**Title:** fix: honor cuda_devices in Singularity backend and support multiple GPUs in Docker

## Description

## Summary

.

- **Singularity**: `cuda_devices` was silently ignored — the `--nv` flag exposes *all* host GPUs. The Singularity backend now sets `SINGULARITYENV_CUDA_VISIBLE_DEVICES` around the container run (Singularity passes it into the container as `CUDA_VISIBLE_DEVICES`), so only the requested host GPUs are visible. Any previously set value is restored after the run, and a warning is logged if it was already set.
- **Docker**: `cuda_devices` now accepts a comma-separated list of device IDs (e.g. `"0,1"`); entries are split on commas and whitespace is stripped.
- Documented that `cuda_devices` refers to **host** GPU IDs and takes precedence over a host-level `CUDA_VISIBLE_DEVICES` (e.g. set by SLURM) inside the container; updated AGENTS.md and `docs/guides/backends.md` accordingly.

## Testing

- `uv run pytest` — 93 passed (tests mock container execution; no Docker daemon/GPU required)
- `uv run ruff check .` and `uv run ruff format --check .` — clean

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3592307cefa7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.