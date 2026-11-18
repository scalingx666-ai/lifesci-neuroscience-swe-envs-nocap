# Issue

**Title:** FIX: Update Codecov orb on CircleCI to latest version

## Description

This updates `.circleci/config.yml` as the following:
```
orbs:
    codecov: codecov/codecov@1.1.5
```

In addition, orb `coverage-reporter: codacy/coverage-reporter@11.9.0` has been removed as not anymore used.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9382238ef6bf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.