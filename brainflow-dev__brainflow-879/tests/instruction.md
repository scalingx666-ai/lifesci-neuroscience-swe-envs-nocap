# Issue

**Title:** Require valid BrainAlive calibration before streaming

## Description

BrainAlive could report successful stream startup without receiving gain and reference-voltage configuration, then record zero-valued EEG samples. Startup now waits for valid configuration and returns BOARD_NOT_READY_ERROR on timeout. Packets without valid calibration are discarded, and calibration is cleared between sessions.

Configuration updates and sample scaling use a mutex-protected calibration snapshot. Seven tests exercise the actual driver for missing/invalid calibration, delayed handshakes, session reset, signed samples, and combined gain above the previous integer-overflow threshold. The conversion-test formatting error is also fixed.

This PR contains only the follow-up to the merged #878.

Validation: Linux BoardController build with PIEEG enabled and warnings treated as errors; all 62 unit tests; clang-format 12.0.1 across all 229 non-excluded source files. All passed locally. GitHub Actions is being checked on the rebased commit. No hardware-in-the-loop testing was performed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ec42722eebdb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.