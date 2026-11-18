# Issue

**Title:** Remove the broken non-CMake Linux build script

## Description

.

- Delete `scripts/standalone_compilation_linux.sh` (didn't build: missing `thirdparty/pugixml`, no `lsl_version.h`).
- Delete `azure-pipelines.yml`: its only job ran that script on manylinux2010 (EOL), so it was already broken. If the Azure pipeline is still connected on the Azure side, it can be disabled there.
- `docs/guide/building.md` (linked from the README as "Building liblsl"): building on the board works with the quick start; `pip install cmake` if the distro's CMake is < 3.23; there is no non-CMake build.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fb50e8e47cdc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.