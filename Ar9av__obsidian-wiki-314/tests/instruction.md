# Issue

**Title:** fix(graph): read tags from the frontmatter only, including the last block-list item

## Description

## Problem

Two small tag-parsing bugs in the graph modules, reproduced on `main` (`055d720`):

1. `graph_analysis.parse_vault_graph` searches the **whole page** for `^tags:`. A page whose body quotes a frontmatter example gets those tags:

   ```markdown
   ---
   title: note
   ---
   Example frontmatter:

   tags: [leaked]
   ```
   gives `tags_map == {"note": ["leaked"]}`.

2. `graphrag.build_index` searches the frontmatter, but the frontmatter group excludes the newline before the closing `---`, and `_TAGS_LIST_RE` needs a newline after every item. When a block-list `tags:` is the last key, its last item is dropped:

   ```markdown
   ---
   title: block
   tags:
     - alpha
     - beta
   ---
   ```
   gives `["alpha"]` instead of `["alpha", "beta"]`.

## Fix

One helper, `graph_analysis.frontmatter_tags(frontmatter)`, takes the frontmatter block only and appends the newline the block-list pattern needs. `parse_vault_graph` passes it `split_frontmatter(text)[0]`; `graphrag.build_index` uses it instead of its own copy of the two regexes. The regexes and the inline/block parsing are unchanged.

## Tests

- `test_graph_analysis.py`: a `tags:` line in the body is not read as page tags; a block list as the last key is read in full.
- `test_graphrag.py`: a block list as the last key is read in full.

Before the fix, two of the three fail (`{'note': ['leaked']}`, `['alpha'] == ['alpha', 'beta']`).

Full suite on Windows 11 (`uv run --with tzdata pytest tests/`): 1158 passed, 8 failed. The same 8 fail on `main` without this change (symlink permissions in `test_trust`, and `test_clock`/`test_hooks`/`test_sync`/`test_claude_plugin` setup tests), so they are unrelated.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `055d720950f7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.