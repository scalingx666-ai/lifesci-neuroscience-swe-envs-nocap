# Issue

**Title:** Retry final upload branch pushes

## Description

.

Retry each final branch push up to three times, covering both `git-annex` and the dataset's default branch. Retries stay inside the push step, so successful annex transfers are not repeated. If every attempt fails, the error names the branch, preserves the original cause, and reports the local repository path for recovery.

Validation: all 53 CLI tests (12 nested steps) pass, including 12 new cases covering immediate success, transient failures, and exhausted retries with Error/null rejection values for git-annex, main, and master. Nine cases fail without the retry wrapper. Deno lint and formatting checks pass for the added helper and tests; formatting also passes for the worker.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `116965317df3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.