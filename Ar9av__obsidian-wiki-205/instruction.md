# Issue

**Title:** fix(cli): report the install mode that actually happened

## Description

When Windows rejects symlink creation (`WinError 1314`), `install_skills` falls back to copying. That fallback was tracked in a local, and `install_skills` runs once per agent directory — so on a non-admin account the warning printed **12 times** and the setup summary still claimed `mode: symlink` while it had actually copied everything.

Hoisted the flag to a module-level `_SYMLINK_FALLBACK`: warn once, skip the doomed `symlink_to` on subsequent directories, and report `mode: copy` in the summary.

## Test plan

- New regression test in `tests/test_cli_install.py`: two agent directories with symlinks denied → warning printed once, flag set, skills still installed as real directories.
- `python -m pytest -q` → 682 passed, 4 skipped (the 9 `test_server.py` errors are pre-existing — `fastapi`/`mcp` not installed).
- Verified on Windows Server 2022 as a non-admin user (ACP 936): before, 12 warnings + `mode: symlink`; after, one warning + `Skills installed: 40  (mode: copy)`.

Same run also confirmed #188 is fixed on a real GBK console — setup exits 0 there.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c4b71c5f83be`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.