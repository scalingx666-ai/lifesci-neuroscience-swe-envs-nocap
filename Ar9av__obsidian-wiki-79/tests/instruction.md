# Issue

**Title:** feat(setup): GitHub sync for vault — wiki-sync command

## Description

## Summary

- **`setup.sh`** gains an optional GitHub sync step (Step 4): prompts for a GitHub repo URL, git-inits the vault if needed, creates a `.gitignore` for Obsidian workspace/cache files, sets the remote, writes `~/.obsidian-wiki/sync.sh`, offers to add a `wiki-sync` shell alias, and optionally installs an hourly cron job
- **`README.md`** gets a new "Syncing your vault to GitHub" section (before the Skills table) explaining the setup flow, `wiki-sync` usage, manual setup, and a privacy note
- **`.env.example`** documents the `VAULT_GITHUB_REMOTE` config key

## Motivation

The common pattern for keeping a local knowledge base versioned is a simple `brainsync`-style alias (`git add -A && git commit -m "sync $(date)" && git push`). This wires that pattern into the obsidian-wiki setup flow so users get it automatically — using the configured `OBSIDIAN_VAULT_PATH` rather than a hardcoded path.

## UX flow (new prompt in setup.sh)

```
  Set up GitHub sync for your vault? [y/N]: y
  GitHub repo URL (e.g. https://github.com/you/my-wiki.git): https://github.com/you/my-wiki.git
✅  Initialized git repo in vault
✅  Created .gitignore in vault
✅  Git remote → https://github.com/you/my-wiki.git
✅  Wrote ~/.obsidian-wiki/sync.sh

  Add 'wiki-sync' alias to your shell? [Y/n]: y
✅  Added wiki-sync alias to ~/.zshrc
    → Run: source ~/.zshrc  (or open a new terminal)

  Enable hourly auto-sync (cron)? [y/N]: y
✅  Hourly cron installed  (logs: ~/.obsidian-wiki/sync.log)
```

Saying `n` to the first prompt skips the whole step — no impact on existing users.

## Test plan

- [ ] Run `bash setup.sh` on a fresh clone, answer `n` to sync prompt — existing flow unchanged
- [ ] Run with `y`, supply a real remote — vault gets `git init`, `.gitignore`, remote set, `sync.sh` written
- [ ] `wiki-sync` (after sourcing shell) commits and pushes; re-running with no changes prints "nothing to commit"
- [ ] Verify cron entry appears in `crontab -l` when hourly sync is accepted

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3af5a369a8bf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.