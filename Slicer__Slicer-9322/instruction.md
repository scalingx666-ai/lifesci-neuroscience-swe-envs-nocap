# Issue

**Title:** ENH: Speed up macOS packaging and make developer builds distributable

## Description

## What this does

3D Slicer's macOS package is assembled by CPack and made relocatable by CMake's BundleUtilities `fixup_bundle()`, which has produced working, distributable disk images for years. This preserves that result while making three improvements:

**1. Much faster.** `fixup_bundle()` walks the dependency graph one binary at a time, calling `otool` repeatedly and copying/rewriting serially — minutes of wall clock on a bundle with ~1000 Mach-O files, and the dominant cost of `make package`. It is replaced by `Utilities/Scripts/SlicerBundleCloseDeps.py`, which walks the graph once (one `otool -l` per binary) and applies the independent install-name rewrites in parallel: the fixup drops from minutes to about half a minute. The disk image is also written as LZFSE (ULFO) rather than the CPack default (UDZO/zlib) — several times faster to compress and slightly smaller.

**2. Much simpler.** Copying each framework whole (so nested code such as `QtWebEngineCore.framework`'s bundled `Helpers/QtWebEngineProcess` comes along and is fixed up automatically) removes the per-file placement table and the hand-written WebEngine / Designer / mis-embedded-framework special cases — roughly 400 lines of the fixup script go away.

**3. Makes developer builds distributable.** Building against a Homebrew Qt on Apple Silicon — as a developer typically does, rather than the Qt the build farm builds itself — left a few references to the Homebrew tree: Qt plugins installed as symlinks, `QT_PLUGIN_PATH` not set before the `QApplication` is constructed, and standalone executables (PythonSlicer, the CLI modules) carrying only build-machine run-paths. The closure installs real plugin files, sets `QT_PLUGIN_PATH` first, embeds and rewrites every external reference — absolute, `@rpath`, or a bare install name — to `@rpath`, gives the standalone executables a bundle-relative run-path, and strips every run-path that pointed outside the bundle, so the result names no build-machine path.

The bundle is re-signed after the fixup (install_name_tool invalidates each signature it rewrites, and on Apple Silicon an invalid signature faults at load) — inside-out, ad-hoc by default (`--identity` for a Developer ID), in parallel.

## Validation

Verified on a clean arm64 macOS VM with **no Homebrew, no Qt, and no build tree**: the packaged application, `python-real`, and the DCMTK CLI executables all launch, and the bundle references no library outside itself across all ~1000 of its Mach-O files.

## Follow-ups (separate PRs)

- Extend the signer toward a notarizable release (hardened runtime + entitlements + notarize/staple). Ad-hoc signing is enough to load and test; testers of an unsigned build clear the quarantine attribute manually.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cb148462aa42`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.