# Issue

**Title:** feat(voice): owner voice file and a never-use check for drafts

## Description

`WRITING.md` controls how wiki pages read. Nothing captured how the owner sounds when an agent drafts something *in their name*: their best posts, the posts they can't stand, and the words they never use. This adds that as one vault page.

**What changes**
- `_meta/voice.md`: an ordinary page with `##` sections, recognised by heading. *Never use* has one word or phrase per bullet, and `leverage -> use` adds a suggested replacement. *Posts I love* and *Posts I hate* are wikilinks or quoted excerpts. Any other section is kept as free-form notes on tone. HTML comments are ignored. `setup` seeds the template once and never rewrites it.
- `obsidian-wiki voice show [--json]`: the parsed lists, for an agent to read.
- `obsidian-wiki voice check FILE|-`: reports every banned word or phrase with its line and column, plus the suggested replacement. Exits 2 on a hit. Matching is whole-word and case-insensitive, and phrases match across any whitespace. Punctuation entries like `—` match literally. Frontmatter, code, wikilinks and link targets are skipped.
- `wiki-narrate` gets an Owner Voice step: read the examples for tone (prose only, never new claims), then rewrite flagged words and check again before returning.
- Docs: a new *Owner voice* section in `docs/cli.md`, plus `docs/memory.md` and the vault tree in `AGENTS.md`.

Independent of #333 (approved facts). The two branches merge cleanly and their tests pass together.

**Tests**
- `tests/test_voice.py`: 10 tests covering heading recognition and synonyms, replacements, comments, dedup, whole-word and case matching, phrases across whitespace, literal punctuation, skipped regions, the missing-file case, CLI exit codes and JSON, and setup seeding once without overwriting.
- Full suite: 1332 passed, 4 skipped (`CI=true`).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b26cca60480f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.