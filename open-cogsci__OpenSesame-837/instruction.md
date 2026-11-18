# Issue

**Title:** Add macOS installer script for Apple Silicon

## Description

## Problem

OpenSesame does not work on macOS with Apple Silicon (M-series) chips:

- The official `.dmg` release is **Intel-only** (`macos-x64`); there is no arm64 build, so it only runs under Rosetta 2 at best.
- The Homebrew cask is disabled (`fails_gatekeeper_check`), so there is no alternative supported install path.
- `pip install opensesame-core` **does** work natively on arm64 — all dependencies ship `macosx_*_arm64`/`universal2` wheels — but there is no documented or scripted way for users to set this up, including the `OpenSesame.app` launcher, Sigmund Analyst, icons, and the macOS ≤13 PyQt6 compatibility pin (PyQt6 ≥ 6.12 wheels require macOS 14).

This is tracked in #806 ("Can not install opensesame on OSX with M1/M2 chip").

## Solution

Adds `macos-installer.sh`, mirroring the existing `linux-installer.sh` workflow:

- Installs OpenSesame and Sigmund Analyst from PyPI into `~/.local/venvs/opensesame-4-1` — native arm64 on Apple Silicon, native x86_64 on Intel.
- Creates an `OpenSesame.app` launcher in `~/Applications` plus `~/.local/bin` wrappers.
- Pins `pyqt6<6.12` / `pyqt6-webengine<6.12` on macOS 13 and earlier, since newer wheels require macOS 14.
- Tolerates failures in optional dependencies (`pygame-ce`, `psychopy`) so the core GUI install always succeeds.
- Documents usage in `readme.md` next to the existing Linux installer, including the `opensesame-core` package-name gotcha.

## Better solution (for maintainer consideration)

This installer is a pragmatic workaround. The proper long-term fix is updating `opensesame-macosx-build-scripts` to produce a native arm64 `.app`/`.dmg`. I have a working set of changes for that repo which:

- restores the `extra()` hook in `conda_env_to_app.py` — it is currently dead code, so the produced bundle is missing `qt.conf` (Qt plugin discovery), `opensesame.py` (required for multiprocessing on macOS), and the Jupyter kernel fix
- detects the environment architecture (`lipo -archs` on the env's Python) and names the DMG `macos-arm64`/`macos-x64` accordingly, instead of hardcoding x64
- makes conda discovery portable (no hardcoded `~/miniconda3` or `/Users/<name>/...` paths) and resolves resource paths relative to the script rather than the cwd
- ad-hoc code signs the bundle by default

The remaining gap is distribution signing: passing Gatekeeper on other machines requires a Developer ID certificate and notarization, which needs an Apple Developer account owned by the project. Questions for maintainers:

- Do you want to ship separate arm64/x64 DMGs or a universal2 build?
- Is there an Apple Developer account available for signing/notarization, or should the DMG remain ad-hoc signed (users right-click → Open)?
- Should the build scripts target specific macOS versions, given PyQt6 >= 6.12 requires macOS 14?

## Test plan

- [x] Ran the installer end-to-end on an Apple Silicon Mac (macOS 27); `opensesame` GUI launches
- [x] `opensesamerun tests/data/response_test.osexp` executes a legacy-backend experiment
- [x] Verify `--uninstall` removes the venv, wrappers, app bundle, and icons

## Manual Test Evidence

<img width="1439" height="746" alt="Screenshot 2026-11-10 at 17 02 05" src="https://github.com/user-attachments/assets/62e7919c-ebae-4204-9fbd-5b8baee0dbe3" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `80df8ca75210`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.