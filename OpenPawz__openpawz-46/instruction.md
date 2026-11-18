# Issue

**Title:** Fix/integration awareness oauth guard

## Description

This pull request enhances OAuth handling and user experience in the integrations catalog and setup guide. The main improvements are reorganizing OAuth service declarations for clarity, ensuring OAuth-only services like Google Workspace do not show manual credential fields, and updating the setup guide UI to clearly inform users when OAuth is available and no API keys are required.

**OAuth handling and catalog improvements:**

* Moved `OAUTH_SERVICE_IDS` and `N8N_OAUTH_SERVICE_IDS` declarations to the top of `catalog.ts` for clarity and to ensure they're available before being referenced by helper functions.
* For Google Workspace, set the credential fields to an empty array to prevent fallback to manual credentials, enforcing OAuth-only connection.
* Removed duplicate `OAUTH_SERVICE_IDS` and `N8N_OAUTH_SERVICE_IDS` declarations from the bottom of `catalog.ts` to avoid confusion and redundancy.

**Setup guide UI improvements:**

* Updated `setup-guide.ts` to conditionally render credential input fields only if manual fields are present; otherwise, display a notice that OAuth is available and no API keys are needed. [[1]](diffhunk://#diff-f1e90b49999558e3223a3bce1f3fa309957bdf7f2fd817b6d2dadfc10a9dd77aL99-R101) [[2]](diffhunk://#diff-f1e90b49999558e3223a3bce1f3fa309957bdf7f2fd817b6d2dadfc10a9dd77aR114-R125)

**Development environment cleanup:**

* Improved the `dev:tauri:clean` script in `package.json` to clean additional directories and caches, ensuring a more thorough reset of the development environment.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fe38f3412044`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.