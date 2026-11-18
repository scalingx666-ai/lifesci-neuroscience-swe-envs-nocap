# Issue

**Title:** Support packaging liblsl as a plain dylib on macOS (Homebrew)

## Description

## Summary
- Non-framework macOS builds got a Linux-only `$ORIGIN` rpath, so `lslver` (and any app linking the dylib) could not find `liblsl.2.dylib`. macOS now uses `@loader_path`, and a caller-provided `CMAKE_INSTALL_RPATH` (Homebrew passes one) is no longer clobbered, both in `CompilerSettings.cmake` and `LSL_configure_rpath()`.
- New `LSL_BUNDLE_DEPENDENCIES` option (default `ON`). Package managers pass `OFF` so `LSL_install_liblsl()`, `LSL_deploy_qt()` and `LSL_codesign()` become no-ops instead of copying liblsl/Qt into the install tree.
- `LSL_install_liblsl()` now detects whether `LSL::lsl` is a framework or a plain dylib on macOS. Previously it walked up three parent directories of the dylib and `file(COPY)`'d that (for Homebrew: the entire Cellar). A dylib is now installed to `FRAMEWORK_DESTINATION` when no `DESTINATION` is given.
- `LSL_codesign()` skips the framework signing step when the framework does not exist.
- README: the Homebrew tap will ship a regular dylib + pkg-config + CMake package instead of `lsl.framework`.

Motivation: the Homebrew tap is moving to a dylib so `-llsl`, `pkg-config`, and non-CMake bindings can find liblsl, and so the same formula works on Linux.

## Test plan
- [x] `-DLSL_FRAMEWORK=OFF` build: `lslver` runs; rpaths are `@loader_path`, `@loader_path/../lib`
- [x] App-LabRecorder against dylib liblsl with `-DLSL_BUNDLE_DEPENDENCIES=OFF`: nothing bundled, nothing signed
- [x] App-LabRecorder against dylib liblsl (default): `liblsl.2.dylib` copied into `LabRecorder.app/Contents/Frameworks` and `Frameworks/`; CLI and app launch
- [x] App-LabRecorder against framework liblsl (default): unchanged (`lsl.framework` bundled, macdeployqt, codesign)
- [x] Homebrew formula built from source with `-DLSL_FRAMEWORK=OFF`; `brew test` passes
- [ ] CI on Linux/Windows (no functional change expected there)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `19c439f4528e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.