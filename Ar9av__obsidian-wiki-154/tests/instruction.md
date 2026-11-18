# Issue

**Title:** Share one GitHub-sync implementation across setup.sh and the CLI

## Description

## Summary

. `setup.sh` (source/curl installs) had an interactive GitHub-sync flow — `git init`, `.gitignore`, remote wiring, a generated `~/.obsidian-wiki/sync.sh`, optional shell alias and hourly cron — that `obsidian-wiki setup` (the entrypoint pip/uv installs actually run) never had. Net effect: the documented pip/uv install path silently skipped git setup, and `.env.example` documented a `VAULT_GITHUB_REMOTE` var that setup.sh only ever wrote to the *global* config (never `.env`) and nothing in the package ever read.

- **New `obsidian_wiki/sync.py`** — single implementation of the git-sync flow: `configure_sync()` (init/`.gitignore`/remote), `run_sync()` (add/commit/push), `get_remote()` (live status, no cached var to drift).
- **New CLI subcommands**: `obsidian-wiki sync-setup <url> [--vault PATH]` and `obsidian-wiki sync [--vault PATH]`.
- **`obsidian-wiki setup`** now offers the same interactive "Set up GitHub sync?" prompt setup.sh always had (guarded by `sys.stdin.isatty()`, same pattern as the existing vault-path prompt), or accepts `--remote <url>` non-interactively.
- **`setup.sh`** no longer hand-rolls git plumbing or generates a `sync.sh` script — its own prompt now calls into the same Python module via the CLI (`PYTHONPATH=$SCRIPT_DIR python3 -m obsidian_wiki.cli sync-setup ...`, preferring the checkout's own source over a possibly-older globally-installed `obsidian-wiki`, which is what actually broke when I first tested this against a stale local install).
- **`obsidian-wiki info`** now shows live GitHub-sync status, read straight from the vault's `git remote` — not a config var that could go stale.
- **`.env.example`, `README.md`, `README_TW.md`, `.skills/wiki-setup/SKILL.md`** updated: dropped the dead `VAULT_GITHUB_REMOTE` var/comment, documented the new `sync-setup`/`sync` commands, and gave the `wiki-setup` agent skill the same sync-offer capability the raw CLI/setup.sh now share.

## Test plan
- [x] `uv run --with pytest pytest -q` — 274 passed (up from 249; 25 new tests), no regressions
- [x] New `tests/test_sync.py` — `configure_sync`/`run_sync`/`get_remote` against real throwaway git repos (init idempotency, `.gitignore` preservation, remote add vs update, actual commit+push to a bare repo, "nothing to commit" on repeat runs, first-push-sets-upstream)
- [x] New `tests/test_sync_setup_parity.py` — regression guard (pattern matches `test_stop_hook_packaging.py` from #143) pinning that `setup.sh` delegates into `obsidian_wiki.cli` instead of re-implementing git logic, and that the CLI exposes the subcommands it depends on
- [x] Manually exercised `obsidian-wiki sync-setup`/`sync`/`info` end-to-end against a scratch vault + bare remote repo
- [x] Manually ran `setup.sh` end-to-end in an isolated scratch checkout (own `$HOME`, fresh `.env`) piping through the vault path → "y" → repo URL → alias → cron prompts; confirmed `git remote -v`, `.gitignore`, and the CLI's live `info` sync line all reflect the configured remote
- [x] Caught and fixed a real bug in my first pass this way: `setup.sh` preferred an already-installed (older, pre-`sync-setup`) global `obsidian-wiki` binary over its own checkout, so the delegation call failed with `invalid choice: 'sync-setup'` — swapped the preference to always run from the checkout via `PYTHONPATH` first

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `073a04cd3796`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.