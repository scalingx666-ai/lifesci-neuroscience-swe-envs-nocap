# Issue

**Title:** feat(facts): approved claims file and a draft check against it

## Description

Agents writing about the owner or their company make up figures ("trusted by 500 teams") and absolutes ("the first", "the only"). This adds a facts file: the short list of things that are true and may be said in public, each with a source and an as-of date.

**What changes**
- `_meta/facts.md`: a markdown table (`ID | Claim | Source | As of | Status | Note`). `setup` seeds it empty next to `profile.md` and `todos.md`. Hand edits round-trip, and rows added without an ID get one on the next write.
- `obsidian-wiki facts list|add|retire|check`:
  - `add` requires `--source`. Re-adding the same text refreshes its source and date instead of duplicating it.
  - `retire` keeps the row so old numbers still get caught.
  - `list --stale-days N` flags claims last confirmed more than N days ago.
  - `check FILE|-` reports claim-shaped sentences (with a number, or an absolute like *first*, *only*, *leading*, *certified*) that no approved fact backs. It exits 2 when anything is flagged.
- Matching works on values: `$2M`, `2 million` and `2,000,000` count as the same number. An absolute is only backed by a fact on the same subject. A number that matches only a retired fact is reported as `retired`, naming the fact. Frontmatter, headings, code, tables, quotes, wikilinks and URLs are skipped.
- `wiki-narrate` gets an Approved Facts Gate: retired claims are always removed, and unsupported claims about the owner go in Coverage (or are dropped in filtered mode). `wiki-query` answers "what can we claim" questions from approved rows first.
- Docs: `docs/cli.md` (new *Approved facts* section), `docs/memory.md`, `docs/architecture.md`, and the vault tree in `AGENTS.md`.

The check is a heuristic. It never edits a draft.

**Tests**
- `tests/test_facts.py`: 25 tests covering number canonicalisation, the backing rules, retired matches, skipped regions, line numbers, the round-trip of hand-edited tables (including escaped `|`), ID assignment, validation, staleness, and the CLI exit codes.
- Full suite: 1346 passed, 4 skipped with `CI=true`. Without `CI`, two `test_session_recap_hook` tests fail on `main` too, because the update-check banner leaks into hook output on a dev install. That's unrelated to this PR.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b26cca60480f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.