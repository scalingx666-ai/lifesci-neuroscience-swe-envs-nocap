# Issue

**Title:** [data_release] add all-files download permission

## Description

## Brief summary of changes

- Adds the `data_release_download_all` permission to the schema, upgrade patch, and RaisinBread setup.
- Allows users with this permission to view and download release files without per-release access.
- Applies the permission to the module, release listing, and file download endpoint.

#### Testing instructions (if applicable)

1. Grant a user `data_release_download_all` without granting access to individual releases.
2. Confirm the user can open `/data_release/`, see release files, and download one.
3. Confirm a user without this permission still needs the usual release access.
4. Confirm upload and permission-management controls remain restricted.

#### Link(s) to related issue(s)

*

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4b730a54a5bc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.