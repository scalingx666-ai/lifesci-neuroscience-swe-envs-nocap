# Issue

**Title:** fix(links): resolve links like Obsidian and stop merging same-named pages

## Description

## Problem

`graph-analyse`, `graph-query`, and `lint` each identify a page by its slugged filename stem and resolve a link by its last path segment. In a vault built from per-project sub-wikis (the layout #270 made visible) that breaks three ways:

1. **Same-named pages merge into one graph node.** On a real vault, the four `projects/*/index.md` files became a single `index` node with 342 links, and 344 pages collapsed into 332 nodes, so hubs, shortest paths, communities, and blast radius were computed over merged pages.
2. **Project-relative links are reported missing.** `[[concepts/plan]]` written inside `projects/a/`, or a `relationships:` target of `../concepts/plan`, resolves in Obsidian but lint flagged it (9 of 9 `missing_target` findings on that vault were false).
3. **Unfollowable links pass.** A cross-project link written as a filesystem path (`[[../../other-repo/.knowledge/decisions/x]]`) points outside the vault's structure, so Obsidian cannot follow it, but lint passed it because only the last segment was compared.

## Fix

New `obsidian_wiki/links.py` with one `PageIndex`, used by all three consumers:

- **Ids:** a page keeps its bare slugged stem unless another page shares that stem, in which case its id is its slugged path. A vault without name collisions gets byte-identical ids and output.
- **Resolution, as in Obsidian:** `./` / `../` relative to the linking file → exact vault path → path relative to the linking file's folder → path suffix → bare name, choosing the candidate that shares the most folders with the linking page (then the shortest path). An over-qualified path link still falls back to the bare name, as before.
- **`ambiguous_target`** now fires only when several pages match and none is nearer than the rest (and still for `Foo Bar.md` beside `foo-bar.md`).
- **Code is not links:** `[[x]]` inside inline code or fenced blocks is ignored (docs that show `[[wikilinks]]` as an example were reported broken).
- **Agent instructions are not pages:** `AGENTS.md` / `CLAUDE.md` / `GEMINI.md` at any depth and the root `README.md` are skipped by `iter_md`, so a sub-wiki's `CLAUDE.md` no longer shows up as a page missing frontmatter. They stay valid link targets for lint (`[[CLAUDE]]` is not broken).
- `graph-analyse --path/--around` and `graph-query` accept a bare name for a page whose id became a path.

Docs: `docs/cli.md` (colliding stems + link resolution).

## Tests

`tests/test_links.py` (10 tests): `PageIndex` ids, nearest-page resolution, `../`, vault escape, code stripping, and each consumer on a two-project vault. The 6 consumer tests fail on `main` and pass here. Existing behaviour is unchanged: full suite 1153 passed, 4 skipped.

On the real vault: graph 332 → 349 nodes (no merges), relationship false positives 9 → 0, doc-example/instruction-file noise removed from lint, and cross-project path links that Obsidian cannot follow are now reported.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0bad9c38c139`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.