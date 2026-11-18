# Issue

**Title:** fix: round-trip index entries a wikilink cannot express

## Description

`rebuild_index` renders every entry as a `[[wikilink]]`, but a wikilink target cannot carry `]`, `#` or `|`. A page named `concepts/notes#1.md` was written as `[[concepts/notes#1]]`, read back as `concepts/notes`, and the set difference in `rebuild_index` then reported the page as both added and removed — the phantom drift `memory index --check` and `doctor` keep warning about, which no command can clear because `changed` stays false for a byte-identical re-render.

## What changed

- Entries whose node contains `]`, `#` or `|` render in the markdown form (`[title](path)`), which is a form Obsidian can resolve for those names and which the index parser already understands. `]` inside the link text is escaped so it cannot close the text early.
- The markdown-entry regex accepts that escape (`(?:\\.|[^\]])*`), so the round trip is the identity: render, then parse, then compare.
- One test: two pages named `concepts/2026-06[final].md` and `concepts/notes#1.md`, `rebuild_index` twice — the second pass reports `added == ()`, `removed == ()`, `changed is False`, and the entries appear as markdown links.

## Verification

- `pytest tests/test_memory.py -q` → **107 passed**.
- Red check with `obsidian_wiki/memory.py` reverted: the new test fails, and the dump shows the entry as `- [[concepts/notes#1]] — Body.`, i.e. the truncated parse the issue describes.
- Not covered here, same root cause, separate surfaces: `hot.md` (`_contradiction_lines`) and any hand-written section still emit `[[node]]` for these names. I left them alone to keep this to the index.

`tests/test_doctor.py` and `tests/test_links.py` fail in this checkout (20 failed / 10 passed) both before and after the change — the package reports `0.0.0+dev` and no skills installed, so those suites need an installed environment.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c5dc0e2d73ba`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.