# Issue

**Title:** ENH: Include architecture in Extensions Catalog URLs

## Description

The Extensions Catalog web application now serves macOS extension packages for both amd64 (Intel) and arm64 (Apple Silicon) (KitwareMedical/slicer-extensions-webapp#240). It takes the architecture from an optional URL segment (`/catalog/:category/:revision/:os/:arch?`). When that segment is missing, macOS defaults to `amd64`, so Apple Silicon builds of Slicer were shown Intel packages.

## Changes
- `qSlicerExtensionsManagerModel::extensionsListUrl()` now returns `/catalog/All/<revision>/<os>/<arch>`. This URL is used by the embedded Extensions Manager install page and by "Open Extensions Catalog website".
- Extension description links (`slicer:<name>`) in the installed extensions list now open `/view/<name>/<revision>/<os>/<arch>`.
- The developer guide now documents the optional architecture segment.

The architecture comes from `Slicer_ARCHITECTURE`. The webapp accepts the segment for every OS, so it is always appended. Linux and Windows URLs now end in `/amd64`.

## Testing
- Checked on windows to verify that `/amd64` is added to `qSlicerExtensionsManagerModel::extensionsListUrl()`
- Added `testExtensionsListUrl` to `qSlicerExtensionsManagerModelTest`. It covers linux/macosx/win with `amd64`/`arm64`, removal of a trailing slash in the frontend URL, and the empty segments (`/catalog/All///`) before `setSlicerRequirements()` is called. It passes locally (Windows, Release).
- To verify on an Apple Silicon build: the Extensions Manager install page should load `.../macosx/arm64`, and the platform selector should show "macOS (Apple Silicon)".

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9ae94df99124`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.