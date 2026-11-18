# Issue

**Title:** Maintenance: run all MATLAB CI on the v3 actions and drop R2020a

## Description

Since 2026-10-01 the R2020a test jobs fail at startup with License Manager Error 4402. The Tests workflow on main has been red since then, and the required "Tests passed" check fails on every pull request. This moves all MATLAB CI to the v3 actions and drops R2020a from CI.

## Why R2020a cannot stay

- The older releases ran through `matlab-actions/setup-matlab` v1 and `run-command` v1. Their CI licensing (feature `MATLAB_Distrib_Comp_Engine`) no longer checks out.
- The first commit on this branch, setting `MW_BATCH_LICENSING_ONLINE`, did not help: the variable was set and the error stayed. The commit is superseded by the rest of this PR.
- Every current alternative stops at R2020b:
  - setup-matlab v3 rejects older releases ("Use 'R2020b' or a later release").
  - `matlab-batch`, which licenses both public projects and batch tokens, refuses them too ("Release must be R2020b or later").
  - An experiment confirmed this: installing R2020a and R2019b with `mpm` works, but no licensing route starts them on hosted runners.
- The same experiment passed the full unit suite on v3, with no batch token, for:
  - R2020b on Linux and Intel Mac;
  - R2021a, R2022a and R2022b on Windows;
  - R2022a and R2022b on Linux and Intel Mac.

  The R2022 failures that kept those releases on v1 no longer occur.

## Changes

**`matlab.yml`: v3 only, from R2020b**

- The version and OS matrix with its exclusions stays as it was. The configure job now also picks the OS list per tier, and `extra` adds the jobs outside it. The v1 steps are removed.
- PR and daily tier, 6 jobs:

  | OS | Oldest | Newest |
  |---|---|---|
  | Linux | R2020b | latest (unit + regression) |
  | Windows | R2022a | latest |
  | Intel Mac | R2020b | |
  | Apple Silicon (`macos-latest`) | | latest |

  macOS jobs are the slowest (15 to 20 min) and only 5 run at a time across the organisation. Hence one Intel job (oldest release) and one Apple Silicon job (newest) instead of the 5 this PR started with.
- Weekly and manual tier: every release from R2020b to latest, with the same per-OS limits as before: Windows from R2022a, Apple Silicon from R2023b, Intel Mac up to R2025b. That is 40 jobs, all with regression tests.

**`compile_mex.yml`**: setup-matlab v3 everywhere. Linux and Intel Mac now build with R2020b.

**`dependabot.yml`**: the MATLAB actions are no longer ignored, since no v1 pin remains.

## Test plan

- [x] Matrix expansion checked locally for both tiers: 6 jobs for PRs and daily runs, 40 for the weekly tier
- [x] Experiment run with the releases above (all on v3, no token)
- [ ] Tests workflow on this PR (the new quick tier)
- [x] Compile MEX dispatched on this branch (run 37130557270): R2020b on Linux inside manylinux2014 (glibc check passed) and on Intel Mac, R2022a on Windows, R2023b on Apple Silicon
- [ ] First weekly full-tier run after merge

Apple Silicon regression tests in the weekly tier stay red until the `bemcp` restore in #171 is merged.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8f2ebf391eec`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.