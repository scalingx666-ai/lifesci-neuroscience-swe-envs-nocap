# Issue

**Title:** docs(skills): add the missing line continuation to two memory sync examples

## Description

## Problem

Two wrapped `obsidian-wiki memory sync` examples are missing the trailing `\` on their first line:

- `wiki-ingest` Step 7: `obsidian-wiki memory sync INGEST source="path/to/source"`
- `wiki-update`: `obsidian-wiki memory sync WIKI_UPDATE project=<project-name>`

Copied verbatim, the shell runs `memory sync` with only the first field, then treats the following lines as a separate command (`pages_created=... --takeaways ...`), which fails. The log line loses its counts and the takeaways never land.

## Fix

- Add the missing `\` to both examples.
- New test `test_multiline_cli_examples_continue_every_line` in `tests/test_memory_docs.py`: flags any wrapped `obsidian-wiki` command in a SKILL.md bash block whose next indented line is not preceded by a `\`. It fails on `main` with exactly these two offenders.
- Drop a duplicated `CODE_UNDERSTANDING_CODEGRAPH_BIN` bullet in `llm-wiki/SKILL.md`.

Full suite: 1138 passed, 4 skipped.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d1bcea4f68f1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.