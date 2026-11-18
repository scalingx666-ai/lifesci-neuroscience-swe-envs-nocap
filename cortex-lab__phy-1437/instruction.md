# Issue

**Title:** Fix graphics diagnostic CI environment and platform assumptions

## Description

Graphics diagnostic checks fail on master and #1436 because nested uv-managed Python 3.10 environments lose their standard library when the executable is copied, the Windows redaction assertion assumes POSIX separators, and Linux real OpenGL checks cannot initialize Qt's xcb plugin.

Use symlinks for the empty test environment on POSIX, expect native path separators in the redaction test, and install the xcb runtime libraries required by the locked PyQt5 wheel in Linux CI. The setup-uv update remains separate in #1436.

Validation: `make lint format-check` passed; `uv run --no-sync pytest -o addopts= scripts/tests` passed (86 passed, 4 real OpenGL tests skipped); the two affected tests passed under uv-managed Python 3.10.20. Reproduced the nested Python 3.10 failure before the fix. Inspected the Linux Qt wheel's ELF dependencies; Windows and Linux real OpenGL validation require CI.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3ee570789302`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.