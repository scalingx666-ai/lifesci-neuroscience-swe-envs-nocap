# Issue

**Title:** Forward the selected toolchain file to superbuild projects

## Description

A toolchain file selected for the outer superbuild is not explicitly passed to its child CMake projects. Forward `CMAKE_TOOLCHAIN_FILE` so the console and dependency configurations can load the selected target-platform and toolchain settings, rather than relying only on individually forwarded compiler/macOS variables.

Add one quoted FILEPATH argument to each of the five ExternalProject CMAKE_ARGS blocks: console, OpenJPEG, yaml-cpp, Cloudflare zlib and zlib-ng. Exactly five lines are added, with no other source changes. This is independent of #1044's architecture-list handling and #1045's SDK forwarding.

Validation was limited to one isolated synthetic toolchain case plus whitespace. Reused #1045's fixture structure to configure local language-NONE children through the five source argument blocks using real CMake ExternalProject configure steps. The absolute toolchain path contained spaces; every child received that exact path and loaded a marker set only by the toolchain file. Outer and all child configurations passed, as did `git diff --check`.

The #1044 architecture receipts and prior SDK/source evidence were reused; those checks were not rerun. No dependency downloads, updates, compilation, installation, imaging tests, dcm_qa or codespell were run, keeping validation to the explicitly requested scope. This proves toolchain propagation, not a complete Apple Silicon build or resolution of the existing conda-forge LTO issue. The harness and receipt are retained locally outside the five-line patch.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5beba99a3fdb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.