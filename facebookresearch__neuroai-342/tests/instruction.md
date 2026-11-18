# Issue

**Title:** docs workflow: fix gh-pages publish (sparse checkout blocked staging)

## Description

: both first publish runs ([main](https://github.com/facebookresearch/neuroai/actions/runs/43207822344), [v0.4.0](https://github.com/facebookresearch/neuroai/actions/runs/43207880388)) built fine but failed at `git add`: the gh-pages worktree inherited the publish job's `docs/scripts` sparse-checkout rules ("paths ... outside of your sparse-checkout definition"). Nothing was pushed.

Fix: check out `gh-pages` as its own full repo (`site/`) and the publishing scripts sparsely in `publish-tools/`; the retry loop resets `site/` to the fetched lease each attempt. The publish job now also runs on PRs, as a publish of `main` stopping right before the push (no credentials persisted), so this kind of failure shows on the PR instead of after merge.

Test plan: replicated the job layout locally (sparse `publish-tools` clone, depth-1 `gh-pages` clone of a bare remote seeded with the live gh-pages) and ran the step for `main` then `v0.4.0`: two forced updates, one parentless commit, `versions.json` = dev + 0.4 (stable), root redirects and `404.html` in place.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `42e5566a195f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.