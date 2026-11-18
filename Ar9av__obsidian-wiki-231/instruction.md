# Issue

**Title:** fix(trust): skip .okignore paths in iter_trust_pages

## Description

. Stacked on #230 (reuses its `.okignore` helpers) — merge that first.

- The dot-directory part of the issue was already fixed in #222; `iter_trust_pages` skips dot-prefixed components today
- Remaining gap: no vault-configurable exclude list, so `trust-record`/`trust-check` still abort on any frontmatter-less `.md` in a quarantine dir (`_excluded/`, PII inboxes) — even for `--page <one-file>`, since the walker validates every page first
- Fix: `iter_trust_pages` now honors the vault-root `.okignore`, reusing the walker lint and `graph-analyse` already use, instead of growing `TRUST_SKIP_DIRS`
- Added one test; docs/cli.md trust section notes the skip rules

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3b3ccf3f2806`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.