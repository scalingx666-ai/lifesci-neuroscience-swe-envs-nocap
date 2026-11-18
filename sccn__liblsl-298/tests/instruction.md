# Issue

**Title:** Separate unsigned Apple PR checks from signed release delivery

## Description

Fork PRs cannot access the Apple certificate and notarization secrets, so the existing Apple workflow fails during certificate import before validating the code. Separate credential-free validation from signed release delivery.

- `Apple CI` continues to run on PRs, branch/tag pushes, and manual dispatch. It builds macOS/iOS/simulator frameworks, runs macOS tests and installed examples, and assembles an unsigned XCFramework. It references no secrets and uses a read-only repository token.
- Xcode signing is explicitly disabled in CI, so no `APPLE_DEVELOPMENT_TEAM` fallback or dummy team is required. CI artifacts are named `unsigned-*` to distinguish them from release packages.
- New `Apple Release` runs only on `release.published` and `workflow_dispatch`. It retains certificate installation, framework and XCFramework signing, installer notarization/stapling, and release uploads. Required credentials are checked up front. Only the deployment job requests `contents: write`; manual runs produce artifacts without attaching them to a release.
- Add `--skip-signing` to the XCFramework helper; signing remains the default. Fix its counter increments so the first framework does not cause `set -e` to exit before assembly.

Validation on macOS with Xcode 26.2:

- Built and installed unsigned universal macOS, iOS arm64, and combined arm64/x86_64 simulator frameworks; iOS configurations explicitly unset the signing identity and development-team variables.
- Assembled all three into a real unsigned XCFramework and zip archive.
- Installed internal tests passed (966 successful assertions, one expected failure); installed exported tests passed (2,163 assertions across 32 cases).
- Built/installed the examples against the unsigned macOS framework and ran `HandleMetaData`.
- `actionlint`, ShellCheck, `bash -n`, and `git diff --check` passed. Checked workflow triggers, secret isolation, read-only CI permissions, and matching platform matrices.
- Mocked the XCFramework helper's signed and unsigned modes: default still signs/verifies, while `--skip-signing` never invokes `codesign`.

Production signing/notarization was not executed locally; it remains restricted to the release/manual workflow.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ab5e080b6799`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.