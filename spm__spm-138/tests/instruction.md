# Issue

**Title:** ci: stop Compile MEX from running on vendored external/ changes

## Description

## What

Two changes to `.github/workflows/compile_mex.yml`:

1. **Exclude vendored code from the push trigger** by appending `'!external/**'` to the `paths` filter.
2. **Set `fail-fast: false`** on the build matrix.

## Why

The `Compile MEX` workflow builds **only SPM-owned sources**: `make -C src` expands to `main-all` + `tbx-all`, recursing into `src/`, `@file_array/private`, `@gifti/private`, `@xmltree/private`, and `toolbox/FieldMap`. It never compiles top-level `external/`. The vendored toolboxes (fieldtrip, bemcp, ctf, eeprobe, mne, ricoh_meg_reader, yokogawa_meg_reader) ship precompiled MEX through the FieldTrip sync, and the separate `external` make target is deliberately kept out of the automated build (it is also known-broken on Windows).

However, the trigger matched any `**/*.c` / `**/*.cpp`, so **every FieldTrip sync PR fired this workflow** to rebuild unrelated SPM-core MEX. That produced no signal about the actually-changed files, and went red whenever the Windows runner's MATLAB `mex` compiler detection regresses (which it did from mid-June, on the pinned R2022a + `setup-matlab@v1` combo). The two macOS legs were then canceled purely as fail-fast collateral while compiling fine.

## Effect

- FieldTrip-sync PRs no longer trigger this workflow at all (they only touch `external/`). SPM-owned C/C++ sources outside `src/` still trigger it correctly.
- When SPM's own sources do change, all four platforms build independently and one failure no longer cancels the others.

## Notes for the reviewer

- The `!external/**` pattern is order-sensitive (it must come after the positive `**/*.c` patterns) and must be quoted, otherwise YAML parses it as a tag. Verified the file still parses.
- This does **not** change *what* gets compiled, only *whether the workflow fires*. `make -C src` never built `external/`, so nothing that was previously compiled is now skipped.
- The underlying Windows compiler regression is untouched and will still surface if SPM's own `src/` changes. Happy to follow up with a compiler fix (install MinGW-w64 for the pinned R2022a, or bump to `setup-matlab@v2`) in a separate PR.
- `Compile MEX` is not a required status check, so this is CI-hygiene only and does not affect the merge gate.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `678ad8179386`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.