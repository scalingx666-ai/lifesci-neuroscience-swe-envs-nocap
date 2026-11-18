# Issue

**Title:** CI: cancel stale PR runs and improve Playwright cache reuse

## Description

## Summary

- Add a `concurrency` group to all four workflows (`run_tests`, `build_docs`, `install_from_wheel`, `codespell`) so that pushing a new commit to a PR automatically cancels the in-progress run for the previous commit. Saves CI minutes when iterating on a PR.
- `cancel-in-progress` is gated on `github.event_name == 'pull_request'`, so pushes to `main` are unaffected and every merged commit still gets its own run.
- Add `restore-keys` to the Playwright browser cache in `run_tests.yml` and `build_docs.yml` so a change to `pyproject.toml` no longer forces a full Chromium re-download — the prior cache is reused as a starting point.

## Why

Previously, pushing a fix-up commit to a PR would leave the prior commit's matrix (5 Python versions × tests + 5 Python versions × wheel install + docs build + codespell) running to completion alongside the new run. The concurrency block is the standard fix.

## Notes for the reviewer

- The grouping key `${{ github.workflow }}-${{ github.head_ref || github.ref }}` ensures (a) different workflows don't cancel each other, and (b) all runs of the same workflow on the same PR branch are grouped (using `head_ref` for PRs, falling back to `ref` for `main` pushes).
- The conditional cancel is intentional — it preserves a green/red signal for every commit on `main`, which is useful when bisecting.

## Test plan

- [x] Push a follow-up commit to this PR and confirm the previous run is cancelled in the Actions tab.
- [x] Confirm pushes to `main` after merge still run all workflows to completion.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0c050bb32417`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.