# Issue

**Title:** fix(setup): use relative symlinks for in-repo skill mirrors

## Description

## Summary

`setup.sh` writes **absolute** symlinks (e.g. `/Users/<name>/obsidian-wiki/.skills/<skill>`) into the in-repo skill mirror directories (`.agents/`, `.claude/`, `.cursor/`, `.kiro/`, `.windsurf/`), but those mirrors are tracked in git as **relative** symlinks (`../../.skills/<skill>`). Every fresh clone is left with ~160 modified files immediately after running `setup.sh`.

This is the same class of bug that 476ac88 (*"complete relative symlink migration across all mirrors and skills"*) fixed in the committed tree — that migration updated the symlinks themselves but missed the installer that recreates them. A contributor running `git add -A` after setup would silently re-commit their home directory into the public repo, undoing 476ac88.

### Repro on `main`

```
$ git clone https://github.com/Ar9av/obsidian-wiki && cd obsidian-wiki
$ bash setup.sh
$ git status --short | wc -l
     160
$ git diff .claude/skills/claude-history-ingest
-../../.skills/claude-history-ingest
+/Users/<your-name>/obsidian-wiki/.skills/claude-history-ingest
```

### Fix

Add an optional third `mode` argument to `install_skills()`. When `"relative"` is passed, the link target is `../../.skills/<name>` — correct for every in-repo mirror, all of which live at `$REPO/<agent-dir>/skills`. Global target dirs under `$HOME` keep the absolute target, which is what they need.

Also fixes a misleading log line — it previously said *"Installed global skills"* even for in-repo dirs.

## Test plan

- [x] Fresh clone + `bash setup.sh` → `git status` is clean
- [x] `.claude/skills/<name>` → `../../.skills/<name>` (relative, matches committed)
- [x] `~/.codex/skills/<name>` → `/abs/path/to/.skills/<name>` (absolute, unchanged)
- [x] Re-running `setup.sh` on an already-installed clone is idempotent (still clean)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `beb6528ffc8e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.