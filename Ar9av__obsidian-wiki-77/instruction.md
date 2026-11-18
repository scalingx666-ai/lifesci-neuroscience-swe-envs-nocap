# Issue

**Title:** fix(cli): warn when installed skills are stale after upgrade

## Description

.

## Problem

After `pip install -U obsidian-wiki`, the globally-installed skills stay at the old version until `obsidian-wiki setup` is re-run. There was no indication this step was needed, so users (including myself) silently ran with a partial or outdated skill set.

## Changes

**`write_config`** — now stamps `OBSIDIAN_WIKI_VERSION` into `~/.obsidian-wiki/config` each time setup completes.

**`_check_stale()`** (new) — called on every CLI invocation except `setup` and `info`:
- If config doesn't exist: warns that setup has never been run
- If stored version ≠ running version: warns that an upgrade happened and setup needs to be re-run
- If `~/.claude/skills/` is missing bundled skills: warns with the count and names

**`cmd_info`** — now shows a per-agent skill install count (`✅ ~/.claude/skills/ (Claude Code): 38/38` or `⚠️  ... 2/38 (run: obsidian-wiki setup)`) so the gap is visible at a glance.

## Example output

After `pip install -U obsidian-wiki` without re-running setup:
```
$ obsidian-wiki list
⚠️  obsidian-wiki upgraded 2026.4.1 → 2026.5.3 but setup hasn't been re-run.
   New skills won't be available until you run: obsidian-wiki setup
claude-history-ingest
...
```

`obsidian-wiki info` with a partial install:
```
Agent skill install status:
  ⚠️  ~/.claude/skills/ (Claude Code): 2/38  (run: obsidian-wiki setup)
  ✅ ~/.codex/skills/ (Codex): 38/38
  ...
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `90086749d1ab`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.