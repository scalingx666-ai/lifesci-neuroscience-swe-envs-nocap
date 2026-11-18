# Issue

**Title:** neuralfetch(cli): polish subcommand help and docstrings

## Description

## Summary

Small follow-up polish to the `neuralfetch` CLI (the `commands/` + `utils/` packages that landed in #223). No behavior change to the commands themselves — just nicer `--help` output and tidier docstrings.

## Changes

- **`commands/__init__.py`**
  - Give each subparser `formatter_class=argparse.RawDescriptionHelpFormatter` so the multi-line `Usage:` examples in each command's docstring survive `--help` (argparse otherwise collapses them).
  - Drop the unused `add_subparsers(dest="command", ...)` — dispatch is via `set_defaults(func=...)`, and nothing reads `args.command`.
  - Remove the redundant `if __name__ == "__main__": main()` guard; the `python -m neuralfetch.commands` entry already lives in `commands/__main__.py`, and the console script uses `neuralfetch.commands:main` directly.
- **`commands/{download,export_bids,study_info}.py`**: convert the RST `Usage::` blocks to plain `Usage:` and move the "argparse glue only" notes from the module docstring into a comment.
- **`utils/data.py`**: reword the module docstring to describe what it does rather than where it moved from.

## Verification

- `ruff check` / `ruff format` / `codespell` clean (pre-commit).
- `python -m neuralfetch.commands --help` and per-subcommand `--help` render correctly; subcommand descriptions now preserve their multi-line usage blocks.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7d84c7011d0b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.