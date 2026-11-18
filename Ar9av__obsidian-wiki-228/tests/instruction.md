# Issue

**Title:** fix(lint): honor vault-root .okignore when walking pages

## Description

## Problem
`lint` only skipped a hardcoded list of directories, so raw inboxes (`_chatwithgpt/`, `_TwitterQoute/`) and per-agent skill mirrors were linted as knowledge pages. That produced hundreds of false broken links, missing frontmatter, orphans and duplicate titles, with no way to turn it off.

## How it works
If the vault root has a `.okignore` file, `lint` and `graph-analyse` skip every page it matches. The syntax is a subset of gitignore:

```
# raw inboxes
_chatwithgpt/      # a bare name matches that folder or file at any depth
*.draft.md         # globs work too
/notes/old         # a path with a slash starts at the vault root and covers everything under it
```

`!` negation isn't supported. Vaults without a `.okignore` behave exactly as before.

## What changed
- `graph_analysis.py`: added `okignore_patterns()` and `okignored()`. `iter_pages()` now uses them.
- `lint.py`: `_iter_pages()` uses the same helpers, so lint and the graph skip the same pages.
- `tests/test_lint.py`: new test showing ignored inbox folders and root-anchored paths produce no findings.
- `docs/cli.md`: documented `.okignore` under `lint`.

## Testing
- The test suite passes.
- Tried it on a sample vault with junk inbox folders. Without `.okignore`: 2 broken links, 3 missing frontmatter, 3 orphans. With `.okignore`: 0 of each. `graph-analyse` still runs cleanly.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `29b810d2c995`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.