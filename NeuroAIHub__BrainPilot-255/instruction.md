# Issue

**Title:** chore: merge main (0.0.11) back into development

## Description

Routine back-merge of released hotfixes from `main` into `development`, so future development branches start from the current released baseline.

## Brought in from main

- `chore(release): bump version to 0.0.11` (#247) — all workspace packages
- `fix(web): clear hasPanned on mouseup so trace-graph node clicks survive a pan` (#253)
- `fix(web): add return-home entry to sidebar for hosted subpath deploys` (#250) (#254)

## Not touched

Development-only KB work stays as-is:
- #249 `feat/kb-panel-inventory` (`f5ea714`, `e459554`)
- #251 `feat(kb): OCR provider abstraction, live-progress SSE, spawn-log secret hygiene` (`b742d9c`)

## Merge details

Merged with `git merge --no-ff origin/main` — **no conflicts**. Diff is exactly the 14 files that were previously main-only (9 `package.json` version bumps + 5 web hotfix files, +123 −18).

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b742d9c0c5f9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.