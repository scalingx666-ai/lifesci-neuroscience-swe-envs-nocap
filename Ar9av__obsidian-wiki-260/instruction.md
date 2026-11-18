# Issue

**Title:** fix(context-pack): read block-scalar title and summary

## Description

## Bug

`.skills/llm-wiki/SKILL.md` tells every skill to write `title` and `summary` as folded scalars (`title: >-` with the value on the next, indented line). `context_pack._frontmatter_values` read the `>-` indicator itself as the value. So for any page that follows the template, `obsidian-wiki context-pack` (and `wiki-context-pack`, which calls it) rendered:

```
## >-
Source: `concepts/agent-memory.md`
...
Summary: >-
```

Ranking was affected too: title and summary matches score 5 and 2 per term, and both were matching against the literal `>-`.

`lint.py` and `memory.py` already handle block scalars. `context_pack.py` was the odd one out.

## Fix

- When the value matches the shared `BLOCK_SCALAR_RE`, collect the indented lines below it.
- `>` folds them with spaces; `|` keeps the newlines.

## Tests

- New `test_load_pages_reads_block_scalar_title_and_summary` covers a `>-` title, a two-line `>-` summary, a `|` literal, and the rendered pack (asserts `## Agent Memory` appears and `>-` doesn't).
- Verified it **fails on main** and passes with the fix.
- `pytest`: 1093 passed, 4 skipped.

**Before and after** on the demo vault from #258:

```
- ## >-                       + ## Agent Memory
- Summary: >-                 + Summary: Anything an agent can recall beyond the current context window: …
```

Found while scouting the README demo recording.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `94e1c401dc23`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.