# Issue

**Title:** feat(plugin): install as a Claude Code plugin from the repo's own marketplace

## Description

## Why

A survey of similar repos showed that the closest competitors with more stars (claude-obsidian at 15k, pi-llm-wiki, personal-os-skills) all install through the Claude Code plugin marketplace. We had no `.claude-plugin/`, so Claude Code users had to go through pip or `git clone`.

## What

- **`.claude-plugin/marketplace.json` + `plugin.json`.** The repo becomes a one-plugin marketplace, and the plugin loads all 40 skills straight from `.skills/` (`"skills": "./.skills/"`). Nothing is duplicated.
  ```text
  /plugin marketplace add Ar9av/obsidian-wiki
  /plugin install obsidian-wiki@obsidian-wiki
  ```
- **No pinned `version`, on purpose.** Claude Code keys the install on the commit SHA, so updates track `main` without anyone bumping a version. `claude plugin validate .` reports this as its only warning, so `--strict` fails.
- **README.md and README_TW.md** add the plugin install under "60 seconds", plus a short **How it compares** table. The table compares against categories (desktop LLM-wiki apps, MCP memory servers, single-skill wikis), not named repos. Named rows would need claims about other projects that we'd have to keep verified.
- **docs/installation.md** gets a new row in the paths table and a new section covering the differences: skills are namespaced (`/obsidian-wiki:wiki-ingest`), the plugin ships skills only (no session hooks, no CLI on PATH), how updates work, and that it's Claude Code only.
- **`tests/test_claude_plugin.py`** pins marketplace → source → plugin.json → skills path, the install ID quoted in the three docs, and the no-version choice.

## Testing

- `pytest`: 1092 passed, 4 skipped.
- `claude plugin validate .` passes with the one expected version warning.
- **Local install** in a throwaway `CLAUDE_CONFIG_DIR`: `marketplace add` and `install` both succeed, and `plugin details` lists all 40 skills (about 6k tokens always-on).
- **GitHub install** in a fresh sandbox: `claude plugin marketplace add "Ar9av/obsidian-wiki#feat/claude-plugin-marketplace"` and `install` succeed, with 40 skills.
- **End to end:** I ran `claude -p "/obsidian-wiki:wiki-setup …"` under a sandboxed `HOME`. It created a complete vault (index, log, hot, manifest, `.obsidian/`, every category dir) and the global config, and `obsidian-wiki doctor` came back green.
- **Update path:** after a new commit, `claude plugin marketplace update obsidian-wiki` followed by `claude plugin update obsidian-wiki@obsidian-wiki` moved the install from `0207fc6` to `4b202c3`. The docs give both commands.
- `python tools/check_readme_sync.py` reports README_TW up to date.

## Found while testing (not fixed here)

1. **`wiki-setup`'s `index.md`/`hot.md` templates predate the memory writer.** `doctor` warns that `memory sync` will skip them until `memory migrate --apply` runs. The unmerged `feat/memory-surface` branch may already cover this.
2. **An empty `OBSIDIAN_VAULT_PATH=` in a `.env` stops config resolution.** The walk-up treats the bare key as found, so it resolves an empty vault path instead of falling through to the global config. This bites anyone who copies `.env.example` into the repo.

## Follow-ups from the same survey

These aren't in this PR:
- a demo GIF at the top of the README
- a forkable demo vault
- moving the OKF bridge to v0.2, which okf-agent-memory and pi-llm-wiki already implement
- a translation contribution path
- repo topics and a headline number in the description

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0207fc6da2d1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.