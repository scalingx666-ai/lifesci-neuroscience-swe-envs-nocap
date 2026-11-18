# Issue

**Title:** chore(ci): Split pre-release tests into cron job, open issues on failure

## Description

In #3745, the pre-release tests are failing, causing other the PR to fail. This is generally not desirable, as these are rarely the fault of contributor PRs. This pulls the prerelease tests into their own workflow, run on a schedule rather than PR. The `ci/prerelease` branch can be used to debug and fix issues.

@remi-gau helped me set this up in nibabel.

Incidentally, also split the install and test tox stages. Sometimes install can fail or take a long time due to infrastructure issues, and it's nice to separate that from test failures at a glance.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b8676b5892ba`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.