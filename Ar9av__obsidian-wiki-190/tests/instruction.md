# Issue

**Title:** fix(graphrag): strip trailing punctuation on the gap and list query paths

## Description

## Problem

`classify_query()` strips punctuation on the `direct` path but not on the `gap`
and `list` paths. Both of those end in `.strip().split()`, and `.strip()` without
arguments removes only whitespace — so a trailing `?` survives on the extracted
term.

The result is that a gap query returns nothing even when the page exists:

```python
from obsidian_wiki.graphrag import classify_query

classify_query("What do I know about mise?")   # ('gap', ['mise?'])   <- matches nothing
classify_query("What do I know about mise")    # ('gap', ['mise'])    <- finds the page
classify_query("What is mise?")                # ('direct', ['mise']) <- direct path is fine
```

`mise?` matches no title, tag or summary, so `query()` comes back with an empty
candidate list. Since gap questions nearly always end in a question mark, this
path was broken for its ordinary input.

## Fix

Both paths now go through a shared `_split_terms()` helper that splits on
whitespace and strips the same punctuation set the `direct` path already used,
now named `_TERM_PUNCT`.

The `direct` path keeps its behaviour unchanged — its `len(w) > 2` guard still
applies to the unstripped token, so only the inline literal is replaced by the
constant.

## Tests

Three regression tests in `TestClassifyQuery` cover the gap path, the list path,
and agreement between the gap and direct paths on the same subject. All three
fail without the fix.

Full suite: 651 passed, 1 skipped (648 before, +3 new).

## Note

While investigating this I ran into a second, larger issue in the same function:
`_score()` matches substrings without word boundaries, and the stop-word set is
English-only, so non-English questions about absent topics return a false
positive flagged `index_only: true` rather than an empty list. That one changes
ranking behaviour, so I left it out of this PR — happy to open a separate issue
with the measurements if that's useful.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `52c9f2bae2fc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.