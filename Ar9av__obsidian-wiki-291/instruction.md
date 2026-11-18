# Issue

**Title:** feat(memory): an unused vault's recap says what to do first

## Description

## Problem
Right after `setup`, every new session gets "Recent vault activity: INIT vault_path=…": the vault's own creation line, repeated each time, and no hint about what to do next.

## Change
- `memory recap`: when there are no profile facts and no open threads, and the whole log holds only `INIT` entries, the recap adds a "Getting started" line: capture with `/wiki-capture`, add documents with `/wiki-ingest` (or `_raw/`), ask with `/wiki-query`. It disappears after the first real write.
- The check reads the whole log, not the project-scoped slice, so a used vault never shows the hint because of a project filter.
- A vault with no log at all still prints "No vault memory recorded yet" and the hook stays silent, as before.
- One sentence in `docs/memory.md`.

Idea adapted from claude-obsidian's seeded `hot.md` ("Add a source to `inbox/`, then ingest it").

## Tests
- `test_recap_suggests_a_first_step_until_the_vault_is_used`: the hint shows on an INIT-only vault and disappears after an INGEST, including under a project filter that matches nothing.
- `test_hook_tells_a_freshly_set_up_vault_what_to_do_first`: the real SessionStart hook on a `scaffold_vault()` vault prints the hint.
- Full suite: 1215 passed, 5 skipped.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `23ec69be4253`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.