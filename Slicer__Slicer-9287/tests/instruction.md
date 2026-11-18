# Issue

**Title:** ENH: Adapt qRestAPI consumption to the modernized CMake package

## Description

> [!WARNING]
> **Depends on the qRestAPI CMake modernization PR — that PR must merge first.**
> The pinned `Slicer_qRestAPI_GIT_TAG` in this PR points at the qRestAPI PR's head commit and **must be updated to the `commontk/qRestAPI` merge commit** once it lands. **Do not merge this PR before qRestAPI is merged.**

## What

qRestAPI's CMake infrastructure has been modernized (commontk/qRestAPI#28, supersedes #27): it removes the legacy `UseqRestAPI.cmake` / `qRestAPI_USE_FILE` and instead exports an imported `qRestAPI` target. This adapts Slicer accordingly:

- **`Base/QTCore/CMakeLists.txt`**: drop `include(${qRestAPI_USE_FILE})`. The include directories now come from the imported `qRestAPI` target, which is already listed in `KIT_target_libraries`.
- **`SuperBuild/External_qRestAPI.cmake`**: bump the pinned `GIT_TAG` to the modernized qRestAPI.

## Verified locally

Full from-scratch Slicer superbuild against the modernized qRestAPI (pulled into the superbuild): Slicer builds to completion, the qRestAPI external ships `qRestAPITargets.cmake` (imported target) with **no** `UseqRestAPI.cmake`, and `libqSlicerBaseQTCore.so` links against the imported target.

## Note on CI coverage

This change edits `SuperBuild/External_qRestAPI.cmake`, so per `.github/workflows/ci.yml` the Slicer build is **skipped** ("Skipping Slicer build due to changes in SuperBuild files"): CI builds only Slicer's core against the prebuilt `slicer/slicer-base` image and does not rebuild SuperBuild dependencies per-PR. This integration was therefore validated with a **local from-scratch superbuild** rather than by CI; it will be exercised by CI only after the dependency image / nightly is regenerated with the new qRestAPI.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c0c4a9ae8289`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.