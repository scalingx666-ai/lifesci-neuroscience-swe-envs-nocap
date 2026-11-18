# Issue

**Title:** Maintenance: collapse the test matrix to a quick and a full tier

## Description

## Why

Before #153, this workflow had three test configurations, driven by two independent conditionals (`is-pr` picked the version set, `github.event.schedule` picked the test class):

| | versions | class |
| --- | --- | --- |
| pull request | R2020a, latest | unit |
| daily cron | all 13 | unit |
| weekly cron | all 13 | regression |

That has two costs. The regression suite runs only on Wednesdays, so a regression can sit undetected for seven days. In practice it was worse: the Wednesday run was red for at least 12 consecutive weeks without being noticed. And because the class is what varies, the fixed per job cost is paid twice a week across the same matrix. Measured on R2024a, checkout plus the 376 MB test data cache, MATLAB install and MEX build come to roughly 4 minutes on ubuntu, 8 on Windows and 13 on macOS, before a single test runs.

Meanwhile the axis that actually drives wall clock is the MATLAB version count, not the test class. GitHub runs at most 5 macOS jobs concurrently, so in [run 32095672043](https://github.com/spm/spm/actions/runs/32095672043) the first five macOS jobs started at 03:29:45 and the eighteenth did not start until 04:27:40, 58 minutes later.

## What changed

Split by MATLAB version instead of by test class, and run both classes in one MATLAB session. Two tiers, not three:

| tier | triggers | versions | jobs | macOS jobs | unit | regression |
| --- | --- | --- | --- | --- | --- | --- |
| quick | pull request, daily cron | R2020a, latest | 6 | 3 | all 6 | 2 (ubuntu only) |
| full | weekly cron, release, dispatch | all 13 | 42 | 20 | all 42 | all 42 |

The quick tier fits inside the 5 slot macOS budget, so it no longer queues, and regression feedback drops from seven days to one. Pull requests and the daily cron run the identical matrix, so a green PR cannot become a red nightly.

The quick tier is 6 rather than 8 jobs because three combinations do not exist as MATLAB builds: R2020a has no Windows build (oldest there is R2022a) and no Apple Silicon build (oldest is R2023b), and `latest` has no Intel Mac build (MATLAB dropped Intel Mac at R2026a). The sixth job is the `extra-os` entry that keeps macos-26 Apple Silicon coverage.

Regression runs on ubuntu only in the quick tier. It adds roughly 11 minutes on ubuntu and 17 on macOS, and macOS is the long pole, so excluding it there takes pull request wall clock from about 39 minutes to about 22 and cuts compute per run by roughly a third. The saving is binary: any macOS job running regression keeps the wall clock at 39, so there is no useful middle ground.

`configure` now emits a `tier` output, so the class choice is expressed against coverage (tier plus OS) rather than against a cron string. `is-pr` survives only to gate the test data checkout, because `spm-tests-data` is private and its token is not available to pull requests from forks.

## Verification

The `configure` and `Select test classes` shell logic was executed directly, and the matrix expanded for every trigger:

| trigger | tier | jobs | regression on |
| --- | --- | --- | --- |
| `pull_request` | quick | 6 | 2, ubuntu-latest |
| daily cron | quick | 6 | 2, ubuntu-latest |
| weekly cron | full | 42 | 42, all five runners |
| `release`, `workflow_dispatch` | full | 42 | 42, all five runners |

## Notes for the reviewer

* This makes the regression suite a gate on every pull request. That only became safe with 97d3080ca, which fixed the `ft_hastoolbox('signal')` detection that made `test_regress_spm_meeg` fail with `Undefined function 'butter'` on every platform. Before that fix, merging this would have turned every pull request red.
* That fix currently lives in SPM's vendored `external/fieldtrip/`, which `sync-fieldtrip.yml` overwrites with `rsync --delete`. Until the equivalent change lands upstream, a FieldTrip sync will revert it and the regression suite will go red again. Worth keeping in mind when reviewing sync PRs.
* The trade for ubuntu-only regression in the quick tier is that platform specific end to end breakage is caught weekly rather than daily. That surface is narrow: the 212 unit tests still run on every platform in both tiers.
* In the quick tier, R2020a is only exercised on ubuntu and Intel Mac, since Windows and Apple Silicon have no build that old. Old release coverage on those two platforms is weekly either way.
* Both classes now share one MATLAB session. `spm_tests` builds a fresh `TestSuite` per call so this should be clean, but the first green run is what actually confirms no state leaks between classes.
* The full sweep runs both classes on 20 macOS jobs at 5 concurrent, roughly 39 minutes each, so about 2.5 hours wall clock. Comfortably inside the 6 hour workflow limit, and the per job `timeout-minutes: 120` leaves headroom.
* Windows regression time is extrapolated, not measured. Only ubuntu (11.1 min) and macOS Intel (16.9 min) were measured directly.
* Unchanged: the test data steps, the MEX build and artifact upload, and the `tests-passed` gate.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `97d3080ca6b2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.