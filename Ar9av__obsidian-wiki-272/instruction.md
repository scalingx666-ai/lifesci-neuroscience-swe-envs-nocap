# Issue

**Title:** feat(memory): opt-in folder hubs keep sub-wikis out of the root index

## Description

## Problem

`memory index` lists every page under its top-level category. In a vault built from per-project sub-wikis (each `projects/<name>/` folder has its own `index.md`), every page of every sub-wiki gets inlined into the root `index.md`. On a real vault that took the root index from ~20 hand-written lines to ~13k words (287 entries, all four projects interleaved under `## Projects`), and nearly every skill reads `index.md` in its "Before You Start" step.

## Change

Opt-in via the root `index.md` frontmatter:

```yaml
index_folder_hubs: true
```

When set, any folder that has its own `index.md` is listed once, as an aliased link to that index plus a page count:

```
- [[projects/alpha/index|Alpha Project]] — Everything about alpha. (3 pages)
```

- Nested hubs collapse into the outermost one.
- Hub title: the index's frontmatter `title`, else its `# H1`, else the folder name (never the bare stem "index").
- The switch lives in the file it governs, so it travels with a synced vault and applies to every `rebuild_index` caller (index, sync, migrate, status, server, Python API) no matter which `.env` the caller resolved. `_ensure_index_marker` already preserves preamble frontmatter, so it survives rebuilds.
- Off by default: existing vaults render byte-for-byte the same.

Documented in `docs/memory.md` and `.skills/llm-wiki/references/MEMORY.md`.

## Tests

- default behaviour still inlines sub-wiki pages
- hubs on: one aliased entry with a count, nested hub collapsed, pages outside hubs unaffected, switch survives the rebuild, rebuild is idempotent
- title fallback to the folder name for an index with no frontmatter or H1

Full suite: 1140 passed, 4 skipped.

Related: #270 (symlinked folders were invisible to the page walker, which is how this layout first surfaced).

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d1bcea4f68f1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.