# Issue

**Title:** Move arm64 GitHub Actions jobs from macos-14 to macos-15

## Description

## Summary

`macos-14` retires on 2026-11-02. In this repo that label is the standard arm64 runner:

- `neuron-ci.yml`: the ThreadSanitizer job, and the Homebrew CMake override that job uses
- `wheels-nightly.yml`: the default arm64 wheel runner, both the form default and the schedule fallback
- `release.yml`: the arm64 half of the release wheel matrix

Those jobs now use `macos-15`, the same 3-core M1 class. `macos-15-intel` and the Azure `macOS-15` image are unchanged.

Arm64 wheels still set `MACOSX_DEPLOYMENT_TARGET=11.0`, so they run on macOS 11.0 and greater.

## Test plan

- [ ] `neuron-ci` on this PR: the macOS-15 ThreadSanitizer job completes
- Nightly and release workflows run only on schedule or `workflow_dispatch`, so this PR does not build those wheels. They use the same `macos-15` label as the CI job.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aca2c7ce5300`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.