# Issue

**Title:** BUG: Name VTK regex version-script node to fix vtktiff link

## Description

.

## Problem

This is a **build regression introduced by #9231** (merged 2026-06-13), the fix for #9181. That PR added `SuperBuild/vtk-hide-stdcxx-regex.ver` — a `std::regex` symbol-hiding version script using an **anonymous** version tag — and applied it to every VTK library through `CMAKE_SHARED_LINKER_FLAGS` / `CMAKE_MODULE_LINKER_FLAGS`. On a clean build that script also lands on the bundled `vtktiff`, whose own version script (`libtiff.map`) defines **named** `LIBTIFF_4.0..4.6.1` nodes. GNU ld refuses to mix an anonymous version tag with named ones:

```
/usr/bin/ld: anonymous version tag cannot be combined with other version tags
/usr/bin/ld: unable to find version dependency `LIBTIFF_4.0'
```

so the `libvtktiff` link fails. Before #9231 there was no version script on the VTK libraries, so `vtktiff` linked fine.

## Fix

Give the version node a name (`SLICER_VTK_REGEX_HIDE`). A named node with only a `local:` section hides the matched libstdc++ regex internals exactly as the anonymous form did, while coexisting with the other named version scripts. One-line change to the `.ver` node (plus a comment).

## Why the regression slipped through

1. **The original fix was validated incrementally.** #9231 was verified against an existing build tree, so VTK's `vtktiff` was never *relinked from scratch* with the new global version script — the anonymous/named conflict only triggers on a clean link of a bundled third-party lib that ships its own named version script.
2. **CI never built it.** `.github/workflows/ci.yml` skips the Slicer build whenever `SuperBuild/External_*` files change relative to `nightly-main` ("Skipping Slicer build due to changes in SuperBuild files"). #9231 modified `SuperBuild/External_VTK.cmake`, so its CI build was skipped. More generally, CI builds only Slicer's *core* inside the prebuilt `slicer/slicer-base` image and does not rebuild the SuperBuild dependencies per-PR, so a SuperBuild-only change is not build-tested until the dependency image / nightly is regenerated.

## Verification

Full from-scratch Slicer superbuild on Linux, GNU ld 2.44:

- `libvtktiff-9.6.so` links, with its `LIBTIFF_4.0..4.6.1` version nodes intact.
- `#9181` hiding preserved: in `libvtkCommon`, the `std::__detail` regex symbols are **local (121) / exported (0)**; the version script is confirmed applied to VTK links.
- The failure reproduces (and the fix resolves it) under **both the gcc and clang drivers**, so it is neither clang- nor binutils-version-specific.

The named-node change was proposed by @hubutui in #9252 and is credited as co-author.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `394cc5296300`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.