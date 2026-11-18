# Issue

**Title:** fix(lint): honor vault-root .okignore when walking pages

## Description

- `lint_vault` and graph `iter_pages` only skipped a hardcoded `SKIP_DIRS`, so raw inboxes and per-agent skill mirrors were linted as knowledge pages
- both walkers now also skip paths matched by a vault-root `.okignore` (gitignore-style subset: component patterns, root-anchored paths; no negation)
-

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `98ff6b1acb3f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.