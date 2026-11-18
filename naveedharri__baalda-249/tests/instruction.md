# Issue

**Title:** Server: unclosed wikilinks no longer fail indexing; quiet state-vector cache conflicts

## Description

## Problems (from production logs)
- `[indexer] failed to index …: index row size … exceeds … note_links_pkey`. An unclosed `[[` (a code block, a stray paste) made `parseWikilinks` capture up to the next `]` across lines. The resulting 6–34 KB "title" overflowed the `note_links` primary key, so the note's link indexing failed on every edit.
- Repeated `[yjs] state-vector cache write failed … could not serialize access` followed by `sv_cache failed (ignored): current transaction is aborted`. `rememberStateVector` swallowed its own error inside `bestEffort`'s savepoint, so the `RELEASE` then ran in an aborted transaction. That logged two errors per read, and the cache was never written for busy docs.

## Changes
- `parseWikilinks`: a link must be on one line and closed (`]]`, `|` or `#`), and titles over 255 chars are skipped.
- `persistence.ts`: the throwing `writeStateVector` runs inside `bestEffort`, so the savepoint rolls back cleanly. The expected 40001 (two readers refreshing the same cache) is no longer logged. Sync behaviour is unchanged.

## Release
Version bump to 0.1.73 (silent release).

## Tests
- `index-engine.test.ts`: new cases for unclosed and over-long links.
- Indexer and persistence suites green.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `67d8b3d07824`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.