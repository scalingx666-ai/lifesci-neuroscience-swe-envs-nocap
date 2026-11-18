# Issue

**Title:** GitHub Workflows security hardening

## Description

This PR adds explicit [permissions section](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions#permissions) to workflows. This is a security best practice because by default workflows run with [extended set of permissions](https://docs.github.com/en/actions/security-guides/automatic-token-authentication#permissions-for-the-github_token) (except from `on: pull_request` [from external forks](https://securitylab.github.com/research/github-actions-preventing-pwn-requests/)). By specifying any permission explicitly all others are set to none. By using the principle of least privilege the damage a compromised workflow can do (because of an [injection](https://securitylab.github.com/research/github-actions-untrusted-input/) or compromised third party tool or action) is restricted.
It is recommended to have [most strict permissions on the top level](https://github.com/ossf/scorecard/blob/main/docs/checks.md#token-permissions) and grant write permissions on [job level](https://docs.github.com/en/actions/using-jobs/assigning-permissions-to-jobs) case by case.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5d436ba45ad9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.