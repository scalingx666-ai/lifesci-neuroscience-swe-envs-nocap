# Issue

**Title:** Set ITK's Platform threader for Windows tests in the package, not only in CI

## Description

## Summary

On Windows, with ITK's default thread pool, the tests pass but R never exits afterwards, so `R CMD check` hangs until it times out. #464 fixed this by setting `ITK_GLOBAL_DEFAULT_THREADER=Platform`, but **only in our GitHub workflow**. r-universe's and CRAN's Windows checks don't use that workflow, so they still hang. ANTsR's Windows builds on r-universe currently fail: the only failing step is "R CMD check", which ran for about an hour on master f3906d6c.

- **`tests/testthat.R`** now sets `ITK_GLOBAL_DEFAULT_THREADER=Platform` on Windows only, unless it's already set, before `library(ANTsR)` loads ITK. Any `R CMD check` gets this: r-universe, CRAN or local.
- **Removed the "Use ITK Platform threader - WINDOWS" workflow step,** so our Windows CI tests the same route r-universe and CRAN will use. If this run's Windows job finishes its tests and exits, the fix works without the workflow.

The examples don't need the variable. Before #464's threader step, the Windows check passed its examples and only hung after the tests finished.

## Note
I couldn't confirm the exact cause of the r-universe ANTsR Windows failure, because GitHub's API was returning HTTP 502 for those build logs. A second possible cause is that ANTsRCore currently has no Windows binary for R 4.6.2 on r-universe (its build fails there), which would force a long build from source. That needs a separate fix in ANTsRCore.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f3906d6c0a90`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.