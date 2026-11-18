# Issue

**Title:** Fix GitHub API rate limit failures in repository topics check

## Description

The repository topics check called the GitHub API without authentication. Anonymous requests are limited to 60/hour per IP address, which is shared with other tenants on GitHub-hosted runners and therefore often already exhausted, making the check fail randomly with HTTP 403.

Pass GITHUB_TOKEN to the validation step and use it in the topics check (same pattern as pin_description_files_scmrevision.py) so requests count against the workflow token's 5000/hour limit instead.

Also raise ExtensionCheckError instead of ValueError on API errors: ValueError is not caught by the check runner loop, so a single failed API request crashed the whole validation run with a traceback instead of being reported as a failed check in the validation report.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `07f1d1b2781c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.