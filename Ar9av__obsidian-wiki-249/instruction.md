# Issue

**Title:** fix(memory): prune the Uncategorized index section when it empties

## Description

.

`render_index` writes a `## Uncategorized` heading for pages outside any category directory, but `rebuild_index` never counted that heading as its own. No directory carries that name, so once you deleted the last loose page, the tool kept the section as human-written text. `--check` skipped its links and missed the stale entry.

The fix adds the empty category to the generated-heading set, the same way `render_index` maps it to `Uncategorized`. A new test in `tests/test_memory.py` covers the case.

Verified:
- The issue's repro now reports `-1 solta` and drops the section on write.
- A second `--check` after that write exits 0.
- `obsidian-wiki lint` reports `broken_links: 0`.
- Full suite: 1010 passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2f1014299134`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.