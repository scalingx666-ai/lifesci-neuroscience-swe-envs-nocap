# Issue

**Title:** Update CI workflows to use buildtool tasks Feature/buildtool ci workflows

## Description

This PR updates the CI workflow files to leverage buildtool tasks, aligning CI with local development workflows and closing the gap between how code is qualified, packaged, and published locally vs. in CI.

  ## Summary

  - `matlab.yml` now uses `run-build` with `check` and runExample` tasks instead of the default build, giving CI the same qualifying steps developers run locally.
  - `release.yml` replaces the old `createMLTBX` command approach with buildtool tasks (`check`, `runExample`, `publish`, `package`). The `package` task reads the version from the `CI_COMMIT_TAG` environment variable set by the release workflow's git tag.
  - `gh-pages.yml` picks up the published examples HTML from `gramm/examples/html/` and deploys it alongside existing docs. Action versions are bumped (`configure-pages@v5`, `upload-pages-artifact@v3`, `deploy-pages@v4`).
  - Removes commented-out blocks and redundant comments from the YAML files, making them simpler and easier to maintain.

  **Note:** This PR depends on #144 (buildtool package/publish tasks). Merge #144 first, then this PR's diff will only show the CI workflow changes.

  ## Issue

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7aef54a945a2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.