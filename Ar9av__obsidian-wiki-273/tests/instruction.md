# Issue

**Title:** fix(memory): count only an entry's own link when measuring index drift

## Description

## Problem

`rebuild_index` decides which pages the index currently lists by collecting **every** wikilink in a category section, including links inside an entry's summary text. A page whose summary contains a link, e.g. `See [[overview|the overview]] first`, makes `overview` look like a listed page that no longer exists.

Effect: every rebuild reports a phantom removal (`+0 / -1`), and `obsidian-wiki doctor` warns `memory-surface: index drift +0/-1` on an index that `memory status` reports as current. The existing `archive_wikilink_relpath` skip was a narrow patch for the same root cause (archive links in summaries).

## Fix

Count only the link that opens each `- ` entry line (`- [[node]]` or `- [title](path.md)`), which is the entry itself. The archive skip is kept for entry links.

## Tests

`test_index_drift_ignores_links_inside_an_entry_summary` fails on `main` with `('overview',) != ()` and passes here. Full suite: 1138 passed, 4 skipped.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7530acce96ab`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.