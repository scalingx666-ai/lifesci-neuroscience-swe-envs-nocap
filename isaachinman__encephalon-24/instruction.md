# Issue

**Title:** [MAR-2527] Run package contract checks in CI

## Description

## Human summary

CI now checks the npm package and publish dry-run contract before release, without publishing anything or rerunning package lifecycle scripts.

## Summary

- Run `bun run check:package` after build on Ubuntu, macOS, and Windows.
- Add an Ubuntu-only release-equivalent package gate that creates and uploads an inspectable `npm pack` tarball artifact.
- Run `bun run check:publish` only on Ubuntu, using an `npm publish --dry-run --ignore-scripts` wrapper so the gate never publishes and never recursively reruns `prepack`.
- Treat npm's already-published-version dry-run response as an acceptable non-publishing validation result for the current `0.1.0` package.
- Document the Ubuntu CI job as the release-equivalent package gate.
- Add a package contract regression test covering the workflow gates and dry-run publish wrapper.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5c412a41371c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.