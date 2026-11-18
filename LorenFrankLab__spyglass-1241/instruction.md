# Issue

**Title:** Add email-on-fail to cron job

## Description

# Description

This PR adds an email service to the cron job process that will notify a designated recipient if it fails.

To avoid the need to choose a CLI mail client, I opted to use `curl`. In the case of GMail, this requires an account with 2-factor auth to have an app password set up, but the steps are straight forward, and could be used with any email service by a power-user

This migrates the variables to an `env` file that should be more manageable in the event that this script is one of the things fetched in an update.

# Checklist:

- [X] No. This PR should be accompanied by a release: (yes/no/unsure)
- [X] N/a. If release, I have updated the `CITATION.cff`
- [X] No. This PR makes edits to table definitions: (yes/no)
- [X] N/a. If table edits, I have included an `alter` snippet for release notes.
- [X] No. If this PR makes changes to position, I ran the relevant tests locally.
- [x] I have updated the `CHANGELOG.md` with PR number and description.
- [X] Yes. I have added/edited docs/notebooks to reflect the changes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `72d523b7ee8b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.