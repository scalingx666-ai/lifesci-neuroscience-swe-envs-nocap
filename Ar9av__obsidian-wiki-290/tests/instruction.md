# Issue

**Title:** feat(setup): new vaults open in Obsidian with colored folders and a clean graph

## Description

## Problem
A freshly set-up vault opens in Obsidian as a plain grey folder list. The graph view mixes knowledge pages with `_raw/` drafts, archives, `index`, `log`, and `hot`. Colors only come from running `graph-colorize` by hand, which a new user doesn't know exists.

## Change
`scaffold_vault()` (used by `obsidian-wiki setup`) now also writes:
- `.obsidian/snippets/obsidian-wiki-folders.css`: one color per category folder in the file explorer, with `_` folders dimmed. It is enabled through `appearance.json`.
- `.obsidian/graph.json`: the same colors as graph `colorGroups`, with staging and bookkeeping filtered out, arrows on, and unresolved links hidden.

The palette is the one the demo vault already uses, kept in a single `CATEGORY_COLORS` map so explorer and graph match. Existing `.obsidian` files are never overwritten. The `wiki-setup` skill describes the same files for the agent path.

Idea adapted from claude-obsidian's vault template.

## Tests
- New `tests/test_scaffold_obsidian.py`: a new vault gets the snippet enabled, every category colored in CSS and graph, and staging excluded; existing `graph.json` and `appearance.json` are left byte-for-byte alone.
- Full suite: 1213 passed, 5 skipped.
- Manual: `obsidian-wiki setup --vault <scratch> --project-only --no-hooks` writes the snippet and a graph with 7 color groups.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `196a3b7fd0a2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.