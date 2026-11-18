# Issue

**Title:** Maintenance: fix the release workflow for Intel Mac, source zip and test_mex

## Description

Three fixes to the release pipeline ahead of the next release. Each would have made the release fail or ship incomplete files.

## Changes

**Pin MATLAB for standalone builds, with Intel Mac on R2025b**

- MATLAB dropped Intel Mac support in R2026a. `latest` now resolves to R2026a, so the `macos-15-intel` leg of `release.yml` would fail to install MATLAB. `matlab.yml` already excludes that combination.
- A failed leg does two things: the release gets no Intel asset, and "Test Released Standalone" is skipped for every OS, because it requires the whole build matrix to succeed.
- The release build now uses R2026a, and R2025b for Intel Mac. `install_test_standalone.yml` uses the same releases. `test_container.yml` uses R2026a, the same as the Linux release build.
- Pinning also means a new MATLAB release (R2026b is due) cannot change the release build without anyone noticing. Bump the pins deliberately.
- The matrix value `version: latest` is kept. Asset names, the Linux-only steps and the standalone test's downloads all depend on it.

**Zip the SPM release before the standalone build**

- `spm_make_standalone` deletes `external/fieldtrip/compat` and `external/fieldtrip/external/signal`, and writes generated files into the tree. The source zip `spm_<tag>.zip` was created after that step.
- As a result, every source zip published through this workflow lacks those folders. Checked for `spm_25.01.02.zip` and `spm_26.01.rc1.zip`.
- Effect for users:
  - Without the Signal Processing Toolbox, FieldTrip's replacements for `butter`, `filtfilt`, `resample`, `hanning` and others are missing, so M/EEG filtering fails.
  - On older MATLAB releases, the compatibility shims such as `readlines` and `clim` are missing.
- The zip is now created right after `Contents.m` is stamped with the version, before the standalone build.

**Skip `test_mex` when deployed or without a C compiler**

- `mex -setup` errors in the compiled standalone (`MATLAB:mex:DEPLOYMENT_MODE_NOTSUPPORTED`), and `spm test` exits 1 on any failed test.
- So the post-release standalone test would fail on all four OS. The same test also fails for users whose MATLAB has no C compiler.
- It now reports Incomplete in those cases and runs unchanged in CI.

**Share the macOS app packaging between release and test builds**

- The standalone test workflow in build mode zipped the raw build output. Its macOS test step expects the `SPM_MacOS_Release/.../SPM.app` layout, which only `release.yml` produced, so the macOS jobs failed at extraction.
- The packaging step moves unchanged from `release.yml` into `.github/scripts/package_macos_app.sh`, and both workflows now call it. A dry run therefore tests what actually ships.
- `release.yml` deletes hidden folders before the build, so it copies the script to `$RUNNER_TEMP` first.

## Test plan

- [x] Workflow YAML parses; matrix include resolution checked: R2026a on Linux, Windows and Apple Silicon, R2025b on Intel Mac
- [x] Tests workflow on this PR
- [x] Dispatch "Test SPM Standalone" before the packaging change: all four builds passed, Linux and Windows tests passed (0 failed; `test_mex` skipped as intended), macOS tests failed at extraction, which the packaging change fixes
- [x] Dispatch "Test SPM Standalone" after the packaging change (run 36712623436): all four builds and all four standalone tests passed. Each OS: 212 tests, 210 passed, 0 failed, 2 incomplete (`test_mex`, `test_checkcode`, both skipped in deployed mode). Runtime R2026a on Linux, Windows and Apple Silicon, R2025b on Intel Mac.

## Follow-ups not in this PR

- The release docs (spm-docs, `development/release.md`) still say the standalone is built with the newest MATLAB on all four platforms.
- The Apple Silicon `external/bemcp` MEX files are still missing.
- The container build in spm-docker needs a fix before a final release.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7f95eaa42388`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.