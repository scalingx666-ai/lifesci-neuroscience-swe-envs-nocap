# Issue

**Title:** fix(vault): follow symlinked directories in the shared page walker

## Description

## Problem

Obsidian treats a symlinked folder as part of the vault, but `iter_md` (the shared walker behind memory, lint, graph analysis, trust, context-pack and the server) uses `Path.rglob`, which does not descend into symlinked directories before Python 3.13.

A vault that mounts its project folders by symlink (e.g. `projects/<name>` -> a `.knowledge` folder inside each project repo) therefore looks empty:

- `obsidian-wiki memory status` reports `pages: 0`
- `memory migrate --apply` / `memory index` regenerate the catalog without those pages, so their `index.md` entries are deleted

On a real vault with 4 symlinked project folders this went from 0 pages to 291 with the fix.

## Fix

Walk with `os.walk(followlinks=True)` and prune any directory whose real path was already visited, so a symlink loop terminates. Paths stay vault-relative (the link path, not the target), so categories and page ids are unchanged.

## Tests

- `test_every_walker_follows_symlinked_dirs`: every walker sees a page behind a symlinked folder (fails on `main`, passes here)
- `test_symlink_loop_is_walked_once`: a self-referencing link does not recurse

Full suite: 1139 passed, 4 skipped.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d1bcea4f68f1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.