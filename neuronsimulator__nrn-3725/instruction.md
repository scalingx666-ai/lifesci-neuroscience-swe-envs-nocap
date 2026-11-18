# Issue

**Title:** ci: fix YAML expression syntax in wheels-template.yml conditional checks

## Description

Fixes "Unexpected symbol" parsing errors in startsWith() expressions by using single quotes for platform names.

Prevents workflow validation failures when full parsing occurs.

Tested via temporary branch triggering coverage workflow.

Note that 4c65b99 basically reverts my coverage.yml change in the dependabot #3723 that bumped tornado to 6.5.5. Grok summarizes with the speculation "it's likely just Codecov being flaky on certain branches during a buggy period, and unconditional token is the pragmatic fix."

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8bc8d00d6e10`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.