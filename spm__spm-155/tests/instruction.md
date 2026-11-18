# Issue

**Title:** CI: store CLA signatures on their own branch

## Description

## Why

The CLA Assistant commits each new signature **directly to the branch it is pointed at**, currently `main`. That is by design, the action stores signatures as a JSON file in git rather than in a database, and its README states plainly: `branch should not be protected`.

We are about to require the `Tests passed` check on `main` so the automated FieldTrip sync PR is gated on the test suite. That rule rejects the CLA bot's commits, and new contributors' signatures would silently stop being recorded.

This was verified rather than assumed, on a fork with the same rule in place. Both routes the action could take are refused:

- `git push` -> `GH013: Repository rule violations found`
- Contents API -> `HTTP 409 Repository rule violations found`

Adding GitHub Actions to the ruleset bypass list is not an option either. The API rejects it with `Actor GitHub Actions integration must be part of the ruleset source or owner organization`, since `github-actions` is a first-party app rather than one installed on the org. That restriction is deliberate on GitHub's side: a bypassable `GITHUB_TOKEN` would let any PR that adds a workflow write to `main`.

## What this changes

- `cla.yml` now points at the `cla-signatures` branch instead of `main`.
- The copy of `signatures/version1/cla.json` on `main` is removed, so there is one live record instead of a second frozen one that would drift out of date.

`cla-signatures` was branched off `main`, so the signature file keeps its **complete history**, all 9 commits back to `b1ba3fb09 Creating file for storing CLA Signatures`. `git log --follow signatures/version1/cla.json` on that branch still shows who signed, when, and in which PR comment. All 8 existing signatures are intact, so nobody is asked to sign again.

Deleting the file here loses nothing either: `main`'s own history still contains every signature commit up to this removal.

## Checked

`cla.yml` is the only thing that referenced the signature path, and the CLA Assistant is the only automated writer to `main`. All 9 bot commits to `main` in the last 24 months are CLA commits; every other workflow either writes to a non-default branch (`sync-fieldtrip.yml`), only creates tags and releases (`release.yml`), or does not write at all.

## Note for review

The CLA check on this PR still runs from `main` via `pull_request_target`, so it reads the old configuration. The change only takes effect after merge. Worth confirming on the first signature afterwards that the commit lands on `cla-signatures`.

Suggested follow-up: give `cla-signatures` a small ruleset blocking force pushes and deletions. `main` has that today through its classic protection, and the signature file is the record that contributors agreed to the CLA.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3d4b6e22585e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.