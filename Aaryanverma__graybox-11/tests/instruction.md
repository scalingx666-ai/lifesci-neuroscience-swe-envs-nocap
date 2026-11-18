# Issue

**Title:** Fix UTF-8 input handling in interactive CLI

## Description

## Summary

Typing accented characters (e.g. `água`) in the interactive CLI input stores them without the accent (`gua`).

## Root cause

1. `_getch()` reads a single byte and decodes it in isolation with `decode("utf-8", "ignore")`. Multi-byte UTF-8 characters (e.g. `á` = `0xC3 0xA1`) arrive as separate bytes; each lone byte is invalid UTF-8 and is silently discarded.
2. `tty.setraw()` uses `TCSAFLUSH`, which discards queued input on every keypress — breaking pasted or fast-typed multi-byte text.

## Fix

- Assemble full UTF-8 sequences in `_getch` (`_utf8_sequence_len` + `_decode_key`) before decoding.
- Switch to raw mode with `tty.setraw(fd, termios.TCSANOW)` so pending input is not flushed between reads.

## Tests

Added `tests/test_cli_input.py` with unit tests for the UTF-8 helpers plus a pty-based integration test that drives `_interactive_input` with `água para as plantas` and asserts the full string is returned.

Full suite: 211 passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f91b61887099`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.