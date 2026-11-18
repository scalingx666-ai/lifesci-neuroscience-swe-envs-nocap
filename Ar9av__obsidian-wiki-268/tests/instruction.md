# Issue

**Title:** feat(cache): report how far each project has drifted from last_commit_synced

## Description

## Why

`check_sources` classifies **file** sources by SHA-256 hash, so it is structurally blind to a git repo whose HEAD moved. `/wiki-update` records a repo under `.manifest.json` → `projects`, keyed by `source_repo` with a `last_commit_synced` bookmark — and nothing ever compared that bookmark to `HEAD`.

Consequence today: a vault can be arbitrarily far behind a repo with **no signal at all**. `cache-check` and `/daily-update` both look like they'd catch it and cannot. `last_commit_synced` was a resume bookmark only.

## What

`check_projects()` + `obsidian-wiki projects-check <vault>` — one `git rev-list --count <last_commit_synced>..HEAD` per `projects` entry.

```
$ obsidian-wiki projects-check /path/to/vault --pretty
{
  "behind": [{"project": "obsidian-wiki", "commits": 3, "last_commit_synced": "113454c…", "path": "…"}],
  "current": [],
  "unreachable": [],
  "unsynced": ["never-synced"],
  "unavailable": [{"project": "elsewhere", "reason": "checkout_not_found", "path": "…"}]
}
```

Read-only; runs no git command that can write.

## Design notes

- **`unavailable` is not stale.** The manifest is portable across machines and `source_cwd_hint` is a *hint*, so a checkout absent from this host is an absence of evidence, not a finding. It exits 0.
- **Exit 2 only for `behind`/`unreachable`**, so a scheduled run can branch on a real finding without failing on a machine that simply doesn't have the repo.
- **`unreachable` splits two cases**: `not_ancestor` (sha resolves but history was rewritten) vs `unknown_commit` (object absent). That mirrors the exit-1 fallback `/wiki-update` Step 2 already documents.
- **`rev-parse --git-dir`, not an `is_dir()` test on `.git`** — a linked worktree's `.git` is a *file*, and the hint may point below the repo root. Both are covered by tests.
- One malformed entry cannot hide a finding in a sibling entry.

## Testing

- `tests/test_project_staleness.py` — 17 tests: commit counting, short shas, rewritten history, unknown commit, missing/non-git/below-root/worktree checkouts, `~` expansion, absent + malformed + wrong-shape manifests, and both CLI exit codes.
- Full suite: **1155 passed, 4 skipped, 311 subtests passed**.
- Verified on **3.9 and 3.12** (the CI matrix).
- Exercised end-to-end against this repo's real checkout, not only fixtures — correctly reported 3 commits behind for a `HEAD~3` bookmark, expanded a `~` hint, and returned exit 2.

## Docs

`docs/cli.md` gains the `projects-check` row, and the `cache-check` row now states that it covers hashed file sources only and points to `projects-check` for repos. Per `CLAUDE.md`, docs changes go to `docs/`, not the README — so no README/translation drift.

## Not in scope

The deeper gap stands: nothing records *which code* a page describes, so prose about rewritten architecture still decays silently. This reports that a project is behind; it does not know which pages are wrong. Closing that needs symbol-level binding (`fiberplane/drift`'s AST-fingerprint lockfile is the prior art, and `ast-extract` already produces the parse).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8db65575bfc5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.