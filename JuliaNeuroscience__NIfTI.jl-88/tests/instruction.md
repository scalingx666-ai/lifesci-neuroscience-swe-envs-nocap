# Issue

**Title:** TagBot: trigger on the registration comment, not only on cron

## Description

TagBot has missed five of the last releases. 0.5.7, 0.5.8, 0.5.9, 0.6.0 and 0.6.2 are all in the General registry with no git tag and no GitHub release, which is why the releases page still shows 0.6.1 as the latest version while Pkg happily installs 0.6.2.

The workflow's only trigger was an hourly cron. GitHub disables scheduled workflows in a repository after 60 days without activity, and TagBot's cron mode only looks back a few days, so any version registered during a dormant stretch is skipped and never picked up again. The v0.6.1 tag shows the pattern directly: it was created in December 2024 and its release notes are headed "Diff since v0.5.6", having jumped over the four versions registered in between.

Switching to the issue_comment trigger is the fix TagBot documents. Registrator comments on the repository when a version is registered, which runs the workflow immediately and does not depend on cron being alive. The actor guard keeps it to those comments and to manual runs, and the workflow_dispatch lookback input allows a wider backfill window when tags have to be recovered.

The explicit permissions block matches the current template and makes the write scope the tag push needs independent of the repository's default GITHUB_TOKEN permissions, which are read-only for many organisations now.

Existing tags are not backfilled by this change.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `67eefd1a521e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.