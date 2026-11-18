# Issue

**Title:** Convert CLI from argparse to typer

## Description

## Summary

Replaces the `argparse`-based CLI with [Typer](https://typer.tiangolo.com/), giving automatic well-formatted help pages, shell completion support, and a cleaner foundation for adding future commands.

### Changes

- **`movement/cli_entrypoint.py`** — rewritten using `typer.Typer()`. The two subcommands (`info`, `launch`) are decorated with `@app.command()`. A `@app.callback(invoke_without_command=True)` handles the no-subcommand case (shows help, exits 0). `typer.echo()` replaces `print()` throughout; `raise typer.Exit(code=1)` is used on `launch` failure so the process exits with a non-zero status code instead of silently returning 0. Shell completions (`--install-completion` / `--show-completion`) are enabled by default via Typer.
- **`pyproject.toml`** — `typer>=0.9.0` added to core `dependencies`. Note: `typer` is already a transitive dependency of `npe2` (the napari plugin engine), so this makes an existing dependency explicit rather than adding a new one.
- **`tests/test_unit/test_cli_entrypoint.py`** — tests rewritten to use `typer.testing.CliRunner`, the idiomatic approach for Typer apps. Coverage is equivalent to the previous suite (valid command, invalid command, no command, napari-not-installed, launch success, launch failure).

### Open questions for maintainers

1. **`typer` version floor** — `typer>=0.9.0` is proposed. Is there a preferred minimum, or should it be left unpinned (`typer`)?
2. **`launch` error exit code** — previously a `CalledProcessError` in `launch` printed a message and returned exit code 0. This PR changes that to exit code 1, which is more correct for signalling failure to calling processes/scripts. Happy to revert if the existing behaviour was intentional.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0098f28efa1b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.