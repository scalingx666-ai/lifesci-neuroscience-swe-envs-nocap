# Issue

**Title:** NF: make run produce a merge commit when command created commits while running

## Description

## Summary

 — when `datalad run` executes a command that creates commits internally (e.g., `datalad run 'touch 123; datalad save -m "committing"'`), the `[DATALAD RUNCMD]` provenance record is now preserved via a merge commit.

- **run.py**: Detect HEAD changes around command execution; when the command creates commits, produce a merge commit (parent1=pre-command HEAD, parent2=post-command HEAD) carrying the run record. Add `datalad.run.dirty-committed` config (default: `error`) for `--explicit` mode to guard against intermediate commits sweeping in undeclared files.
- **rerun.py**: Accept 2-parent run-merge commits as rerunnable (only warn for 3+ parent octopus merges). Checkout first parent to recreate pre-command state during rerun.

## Test plan

- [x] `test_run_cmd_creates_commits` — merge commit with valid run record
- [x] `test_run_no_merge_without_inner_commits` — regression: normal runs unchanged
- [x] `test_run_multiple_inner_commits` — single merge wrapping multiple inner commits
- [x] `test_run_inner_commits_plus_uncommitted` — merge includes leftover uncommitted changes
- [x] `test_run_explicit_undeclared_committed_error` — dirty-committed check errors
- [x] `test_run_explicit_undeclared_committed_ignore` — dirty-committed config override
- [x] `test_rerun_of_merge_run` — single rerun of a merge-run commit
- [x] `test_rerun_range_with_merge_runs` — range rerun with `--onto`
- [x] `test_rerun_invalid_merge_run_commit` — updated: octopus merge warning
- [x] Full `test_run.py` suite (29 passed), `test_rerun.py` (21 passed), `test_rerun_merges.py` (15 passed)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `48079c622f14`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.