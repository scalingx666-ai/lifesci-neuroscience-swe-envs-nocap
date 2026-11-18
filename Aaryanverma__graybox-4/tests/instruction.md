# Issue

**Title:** Fix TUI hang on Esc and broken Enter key in raw-mode fallback

## Description

, and fixes a second bug found while testing that fix.

## What was broken

**1. Esc hangs the whole TUI (#1).** `readchar.readkey()` does a blocking read to disambiguate a bare `ESC` from the start of an arrow-key escape sequence (both start with `\x1b`). If no follow-up byte arrives, i.e. the user just pressed Esc alone, it blocks forever, so every `(Esc to cancel)` prompt (`capture`, `ask`, `search`, `create-workspace`, ...) hangs until Ctrl+C.

**2. Enter silently does nothing in the interactive menu (found while fixing #1).** The existing manual POSIX fallback in `_getch()` (the `termios`/`tty.setraw()` branch) already handles Esc correctly via a short `select()` timeout, but it was only reached if `readchar` raised, which it never does for this case (it just hangs). Once I reprioritized that fallback ahead of `readchar` to fix #1, a second, previously-dormant bug surfaced: under `tty.setraw()`, `ICRNL` is disabled, so pressing Enter delivers a raw `\r`, not `\n`. The check `ch in (b"\n", b"\n")` (note: duplicated literal, `\r` is never checked) never matched, so Enter silently did nothing in that code path. This never showed up before because `readchar` was always tried first, and it leaves `ICRNL` on, so the terminal driver itself translates `\r` to `\n` before `readchar` ever reads it.

## Fix

- `_getch()` now prefers the existing OS-native readers (`msvcrt` on Windows, the manual `termios`/`tty` reader on POSIX) over `readchar`. Both already disambiguate Esc-vs-arrow-keys correctly via a timeout/prefix check. `readchar` is kept only as a last-resort fallback if neither is importable.
- Fixed the Enter check to accept both `\n` and `\r` (`ch in (b"\n", b"\r")`).

## Testing

- Reproduced the hang in isolation: spawned a pty, called `readchar.readkey()` directly, sent a lone `\x1b`. The call never returned.
- Reproduced the Enter regression the same way: sent a raw `\r` through `_getch()` after the reprioritization; it returned the literal string `"\r"` instead of `Key.ENTER`.
- Verified both fixes the same way: Esc now resolves to `Key.ESC` immediately, Enter now resolves to `Key.ENTER` immediately.
- Full test suite passes unmodified: `178 passed`.
- Manually tested end-to-end in the interactive menu (arrow-key navigation, Enter to select, Esc to cancel) on:
  - Fedora Linux 44, niri compositor (Wayland session)
  - Python 3.14.6, readchar 4.2.2
  - fish shell, `TERM=xterm-256color`

Happy to split this into two commits/PRs if you'd rather review the Esc fix and the Enter fix separately; they touch the same few lines so I kept them together.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8e0f1f0cb2b8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.