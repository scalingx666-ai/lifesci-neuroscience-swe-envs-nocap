# Issue

**Title:** Fix tests

## Description

The title says it all.
Anyway, @caglorithm, we should discuss maybe dropping support for lower python than 3.8.. The thing is, `xarray` did drop the support for 3.7 (and obviously for 3.6) some time ago (), so now loading .nc files (in `Signal` class, as done in example-3) requires hacky workaround - we need to downgrade `importlib-metadata` (dependency of `xarray`)...
The problem, of course, is that due to `pypet`, only python 3.6 and 3.7 work on macOS... so dropping support for 3.6 and 3.7 would mean dropping support for macOS :/ Or, getting rid of `pypet`...
But for now, tests should work...

@lenasal after this is merged, please rebase your PR onto the new master; then it should work for you:)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0db88b59fa70`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.