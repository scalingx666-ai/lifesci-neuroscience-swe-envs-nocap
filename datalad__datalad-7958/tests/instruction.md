# Issue

**Title:** CI+DOC: release MAJOR.MINOR.0 from master; make master's fragments count for the bump

## Description

Prepares `master` (which now has 1.6.6 merged in) for the 1.7.0 release. There are two commits.

### 1. `release.yml` can release from `master`

- **Trigger:** `master` is added to the `pull_request_target` branches next to `maint`.
- **Checkout:** the job now checks out the branch the PR was merged into, or the branch picked in "Run workflow". Since [Dec 2025](``https://github.blog/changelog/2025-11-07-actions-pull_request_target-and-environment-branch-protections-changes/),`` `pull_request_target` runs, and by default checks out, the **default branch (`maint`)**, whatever the PR's base is. So adding `master` to the filter alone would have released `maint`.
- **Check before a `master` release:** it fails unless `maint` is merged into `master`. Otherwise the release would lack `maint`'s fixes or reuse `maint`'s latest version. `test-label.yml` does the same check, but only for PRs, not for "Run workflow".
- **Step after a `master` release:** it fast-forwards `maint` to the new tag, which CONTRIBUTING.md asked us to do by hand. The push isn't forced, so if `maint` got commits meanwhile it fails with a clear error instead of overwriting them.
- **Docs:** CONTRIBUTING.md is updated to match. It now also says that release-action decides the bump only from `changelog.d/pr-NUMBER.md` fragments, using the `semver-` labels of those PRs. Fragments named the way `scriv create` names them are ignored for the bump.

### 2. Rename the fragments on `master` to `pr-7920.md`, `pr-7929.md`, `pr-7930.md` (and this PR's own to `pr-7958.md`)

#7920, #7929 and #7930 are all `semver-minor`. With the `scriv create` names, release-action would have skipped them and released **1.6.7**. I ran release-action's own `versions`/`config` code on this tree, with labels fetched over REST, and it gives `minor` from `1.6.6`, so **1.7.0**. The rename also gets the "released in 1.7.0" comments onto those PRs and the issues they close.

### Releasing after merge

`maint`'s `release.yml` doesn't list `master` yet, and `pull_request_target` reads the workflow from `maint`. So merging this PR, with or without a `release` label, will **not** start a release by itself. Use "Run workflow" on `master` once. That runs this PR's `release.yml`: it checks that `maint` is merged, releases 1.7.0, and fast-forwards `maint` to it. From then on `maint` has the new workflow too, and later release-labelled PRs into `master` release on merge.

### PR checklist

- [x] Overview of the changes and why: see above.
- [x] Changelog snippet: one line under 🏠 Internal (`changelog.d/pr-7958.md`).
- [x] Checks: `actionlint` and `codespell` pass. I tested the fast-forward push refspec (`TAG^{commit}:refs/heads/maint`) in a scratch repo: it moves `maint` when `maint` is behind and is refused when `maint` has diverged. The workflow itself hasn't run on GitHub yet.

Not covered here: nothing prevents a `master` release from coming out as a patch release. A check inside the workflow would come too late, because release-action posts its "released in X" comments before any `pre-tag` hook could stop it. That check belongs in release-action itself, for example as a minimum-bump input.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01SfgZwsSyinnDepEme3uu8i

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a6cd229e5d71`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.