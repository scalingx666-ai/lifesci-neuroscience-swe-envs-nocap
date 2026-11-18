# Issue

**Title:** fix(ci): drop the drifted pnpm pin that fails every web job before it runs

## Description

## Summary

`pnpm/action-setup` is pinned to `10.31.0` in all three web jobs, while `package.json`'s `packageManager` moved to `pnpm@10.33.2`. The action refuses to start when both are set:

```
Error: Multiple versions of pnpm specified:
  - version 10.31.0 in the GitHub Action config with the key "version"
  - version pnpm@10.33.2 in the package.json with the key "packageManager"
```

So **Consumer Smoke Tests**, **Validate npm package tarballs**, and **Run all web package tests** have been failing on every push, on `main` as well as on PRs, before a single test body executes. Confirmed red on `main` at `b266b1d`, `de8ee0d` and `ecf5279`.

## The fix

Removes the pin from all three jobs and lets `packageManager` be the single source of truth, which is the same fix `peak-app` landed for the identical failure. Bumping `packageManager` is now sufficient; there is no second place that has to be updated in lockstep, which is what allowed the drift in the first place.

## Scope

Deliberately does **not** touch the two Rust jobs (`Format check`, `Clippy`). Those are also red on `main`, for their own unrelated reasons (import ordering in `examples/hal_demo.rs` and `tests/hal_pipeline.rs`; a `collapsible_if` lint in `elata-eeg-signal`), and they are a separate concern from this one.

## Test plan

- [x] `version: 10.31.0` no longer appears anywhere in the workflow
- [x] All three `pnpm/action-setup@v4` blocks still present, now without the conflicting key
- [x] Workflow still parses (`yaml.safe_load`, 7 jobs)
- [ ] The three web jobs get past setup on this PR's own run, which is what actually proves it

Noticed while looking at why #32's CI was red. This unblocks that PR and every other one.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b266b1d3f17d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.