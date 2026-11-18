# Issue

**Title:** fix(server): Prevent datacite failures on title formatting or extra contributors fields

## Description

Fixes a few issues with datacite.yml handling and DOI minting. We'd pull the wrong field and default to N/A for titles if datacite.yml was present and the contributors field would sometimes be submitted with invalid data. This provides reasonable fallbacks for these cases (dataset_description for the title and stripping invalid name fields).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b54c14817e57`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.