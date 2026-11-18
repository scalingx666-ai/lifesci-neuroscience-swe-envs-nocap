# Issue

**Title:** CI: fast-forward master to maint automatically

## Description

Adds a "Fast-forward master to maint" workflow (`.github/workflows/fast-forward-master.yml`), so that `master` keeps up with `maint` for as long as it has no commits of its own.

## What it does

On every push to `maint`:

- **`master` already contains `maint`:** nothing happens. This includes the two branches being identical, as they are right now, at `4cdd58b24`.
- **`master` is behind `maint` and has no commits of its own:** `master` is fast-forwarded to `maint`. It is a plain `git push`, which is refused unless it is a fast-forward.
- **`master` has commits of its own:** `master` is left alone, and the run says so in a notice without failing. Merging `maint` into `master` stays a manual step for now, as discussed in review.

It also runs:
- **When a release is published:** the release workflow's commits to `maint` carry `[skip ci]`, and that suppresses their push event, so without this trigger a release from `maint` would not reach `master` until the next push to `maint`.
- **By hand:** via `workflow_dispatch`.

Runs are queued rather than cancelled, and each one starts from the current branches, so an extra run does no harm. The workflow only runs in `datalad/datalad`, not in forks.

## Why `GITMATE_GITHUB_TOKEN`

A push made with the default `GITHUB_TOKEN` would not trigger the workflows on `master`. The release workflow already uses this token to push to the protected `maint` and `master`, and this workflow relies on the same permission to fast-forward the protected `master`.

## Testing

- `actionlint`, with `shellcheck`, reports nothing.
- I ran the step's script, extracted verbatim from the workflow, against a local bare repository standing in for `origin`, in four scenarios:
  - the branches identical: nothing to do;
  - `maint` ahead: `master` is fast-forwarded;
  - `master` ahead: nothing to do;
  - the branches diverged: a notice is printed and `master` is left unchanged.

The changelog snippet is in `changelog.d/pr-7978.md` (`🏠 Internal`).

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01PvaGRY7auLbAfwNGj21YXd

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4cdd58b243ba`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.