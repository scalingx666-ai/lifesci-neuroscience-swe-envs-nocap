# Issue

**Title:** CI: Port docs build and deploy from CircleCI to GitHub Actions

## Description

## Summary
- add a new `/Users/oesteban/workspace/smriprep/.github/workflows/docs.yml` workflow to port `build_docs`, `deploy_docs_master`, and `deploy_docs_tag` from CircleCI to GitHub Actions
- keep docs publishing on `gh-pages` and gate deploy jobs on successful `Build-Test-Deploy` `workflow_run` events
- preserve force-versioned commit token support (`[docs version]` / `[docs versions]`) and branch/tag deploy behavior
- remove CircleCI docs jobs and docs deploy anchor from `/Users/oesteban/workspace/smriprep/.circleci/config.yml` to avoid dual deploy races

## Behavior parity
- preview docs builds still run on PRs and non-`master` branch pushes
- preview docs skips `test/*`, `tests/*`, `ds005/*`, and `ds054/*` branches
- versioned docs are built on tags, on `master`, or when commit message token is present
- deploy commits to `gh-pages` as `nipreps-bot` with message `doc(update) [skip ci]`

## Validation
- parsed workflow YAML with Ruby `YAML.load_file` for both modified files
- `actionlint` is not available in this environment
- CircleCI CLI is not available in this environment

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6224ac3630df`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.