# Issue

**Title:** Grey out unresolved wiki-links and stop creating notes on click

## Description

Clicking a wiki-link to a note that does not exist created a new note at the vault root. Now: the link is greyed out (`cm-wikilink-unresolved`, muted colour, default cursor) and a click does nothing; resolved links behave exactly as before, including inside tables.

Resolution rule mirrors Rust `resolve_wikilink` against the store's titles: strip alias/heading/.md, then match a note's path, basename or title case-insensitively. Titles changes re-style the editor through a StateEffect. Links to non-note file types are never greyed, since the titles feed lists notes only.

Desktop vitest 2466, typecheck clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fb59b676e520`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.