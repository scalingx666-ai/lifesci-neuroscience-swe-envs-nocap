# Issue

**Title:** Make ninja format work in git worktrees

## Description

## Summary

`ninja format` / `ninja format-pr` was a silent no-op in a linked git worktree (checkout whose `.git` is a gitfile, e.g. `git worktree add`). The coding-conventions `source_dir()` helper treated `parent(git-dir)` as the repo root, which is `<primary>/.git/worktrees` rather than the worktree, so `.bbp-project.yaml` was not found and no tools ran (exit 0).

This pins `external/coding-conventions` at merged master `4bb2c5f` (), which uses `git rev-parse --show-superproject-working-tree`. Docs note that a `git worktree add` checkout is a supported way to run format.

Black version / Python 3.14 is **not** in this PR.

## Test plan

* Local: `PYENV_VERSION=3.12 ninja format` (or `bin/format -q --lang python <one .py>`) from a `git worktree add` checkout prints the Black version banner and does **not** print `No tool enabled for task format`
* Local: same from a primary clone still works
* CI: Check formatting on this PR

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `67fb8c6e8eaa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.