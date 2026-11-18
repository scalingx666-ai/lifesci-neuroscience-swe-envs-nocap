# Issue

**Title:** feat(capture): auto-capture findings at session end via Stop hook

## Description

## Summary

Ports the core insight from [activeloopai/hivemind](https://github.com/activeloopai/hivemind) — automatic session-end knowledge capture — into the wiki framework.

- **`.claude/hooks/wiki-stop-capture.sh`** — shell hook that fires on Claude Code `Stop` event. Reads the session transcript JSONL, counts file edits (`Write`/`Edit`) and shell calls (`Bash`), and if significant work happened (≥1 file edit or ≥4 shell calls), feeds back a message prompting `/wiki-quick-chat-capture`. The `stop_hook_active` guard prevents infinite re-entry.
- **`.claude/settings.json`** — wires the hook into the project's Claude Code settings so it activates automatically for sessions in this repo.
- **`wiki-quick-chat-capture/SKILL.md`** — adds a **KEEP/SKIP gate** as Step 0. Makes the skill safe to auto-invoke: purely conversational sessions exit immediately; sessions with concrete findings proceed. Manual invocations err toward KEEP; automatic invocations err toward SKIP.
- **`wiki-setup/SKILL.md`** — new optional step to install the hook globally into `~/.claude/settings.json` so it fires across all projects, not just this repo.

## Test plan

- [ ] Start a Claude Code session in the repo, make a file edit, let it stop — hook should fire and prompt `/wiki-quick-chat-capture`
- [ ] Start a session, ask only conversational questions (no tool use), let it stop — hook should exit 0 silently
- [ ] Run `/wiki-quick-chat-capture` in a session with only meta-conversation — gate should return SKIP with "Nothing worth capturing"
- [ ] Run `/wiki-quick-chat-capture` after a debugging session with a concrete fix — gate should return KEEP and write a `_raw/` file
- [ ] Run `wiki-setup` and confirm the optional hook installation step appears at the end

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1b72fdb4315d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.