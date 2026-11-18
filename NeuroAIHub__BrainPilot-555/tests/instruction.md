# Issue

**Title:** fix(docker): make docs builds and GPU checks reproducible

## Description

Building `docker/main/Dockerfile` after a host documentation build copies generated Fumadocs/Next caches into the image. Those caches contain the host's absolute `.source/source.config.mjs` path, causing the container build to fail resolving MDX files outside its filesystem root.

Exclude only the docs workspace's `.source`, `.next` and `out` directories from the Docker context. Documentation source remains included and is regenerated inside the builder. The paired GPU documentation checks also use `python3`, the executable verified in the published-base-derived GPU image. No runtime code, dependency, version or published tag changes.

Validation: reproduced on the Linux release checkout after a full host build; the same main builder now passes with all English/Chinese docs exports present. A real NVIDIA A10 tensor check passed with `python3`. The full Linux/amd64 main image now builds successfully from current head c69474a6 with the standard release proxy arguments; DataLad 1.6.0, DANDI 0.76.7 and wget checks pass. Actual dataset/container restart smoke follows before release acceptance.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `152e8fb2c646`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.