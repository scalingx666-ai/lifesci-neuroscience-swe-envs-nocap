# Issue

**Title:** fix(hooks): write Git Bash paths when registering hooks on Windows

## Description

.

## The bug

On Windows, hook registration wrote commands like `bash C:\Users\...\wiki-session-recap.sh` into `~/.claude/settings.json`. Claude Code runs hooks in Git Bash, where those backslashes are escapes — the path collapses to `C:Users...`, both hooks exit 127 silently, and the session recap is never injected.

## The fix

- `_git_bash_path()` converts a Windows path to the MSYS form Git Bash resolves (`/c/Users/...`); it is a no-op on every other platform.
- `_command_for()` uses it for both the pinned `PATH=` prefix and the script, and now quotes the script path, which also fixes home directories with spaces. Forward slashes alone would fix `bash <script>` but not the `PATH=` prefix, where the drive colon collides with the PATH separator.
- `install()` drops our own entries whose command contains a backslash before appending. Without this, an install predating the fix still counts as registered, so the idempotent installer skips it and the hook stays dead forever. Unrelated hooks in the same event group are untouched.

## Tests

Three added in `tests/test_hooks.py`: the path conversion and resulting command under a monkeypatched `os.name == "nt"`, the script path being quoted, and install rewriting a backslash registration while keeping someone else's hook.

`tests/test_hooks.py` and `tests/test_session_recap_hook.py` pass. Full suite: 1119 passed, 4 skipped; the `tests/test_server.py` errors are a pre-existing missing `mcp` module locally, unrelated to this change.

Verified on macOS only — the Windows path is covered by the monkeypatched test, not a real Windows run.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0cc5d905acff`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.