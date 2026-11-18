# Issue

**Title:** [ENH] BEP032: Rename stream_id to stream_identifier

## Description

.

Column names ending in `_id` in BIDS refer to entities, and the data stream within a file is not an entity. As discussed in the working group meeting on 2026-08-26, this renames the `stream_id` column to `stream_identifier` in `channels.tsv` and in its use in `events.tsv` for multiple recordings stored in one file, so that both change at the same time. The column description in the schema is also expanded, since the previous one ("Data stream of the recording the signal") did not read well.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01QPCasNDSUAn4ZcoqBhXU5p

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9f5f8753357f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.