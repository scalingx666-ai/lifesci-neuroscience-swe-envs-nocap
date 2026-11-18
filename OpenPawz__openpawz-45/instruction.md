# Issue

**Title:** Fix/integration awareness oauth guard

## Description

This pull request improves the integration setup flow by clarifying OAuth support and credential requirements for services, ensuring users are guided accurately depending on the authentication method. The changes primarily affect how OAuth-capable services are handled in the catalog and UI, preventing confusion and unnecessary credential prompts.

**OAuth handling improvements:**

* Moved the declarations of `OAUTH_SERVICE_IDS` and `N8N_OAUTH_SERVICE_IDS` to the top of `src/views/integrations/catalog.ts` for better visibility and to ensure they're available before being referenced by other functions.
* Removed duplicate declarations of `OAUTH_SERVICE_IDS` and `N8N_OAUTH_SERVICE_IDS` from the bottom of the file to avoid redundancy and potential confusion.

**Credential field logic and UI updates:**

* Updated the `CURATED` array entry for Google Workspace to use an empty array for credential fields, indicating OAuth-only support and preventing fallback to manual credential overrides.
* Modified the setup guide rendering logic in `src/views/integrations/setup-guide.ts` to show credential fields only if required, and to display an informative message for OAuth-only services instead of prompting for API keys. [[1]](diffhunk://#diff-f1e90b49999558e3223a3bce1f3fa309957bdf7f2fd817b6d2dadfc10a9dd77aL99-R101) [[2]](diffhunk://#diff-f1e90b49999558e3223a3bce1f3fa309957bdf7f2fd817b6d2dadfc10a9dd77aR114-R125)

**Development script enhancements:**

* Expanded the clean-up process in the `dev:tauri:clean` script in `package.json` to include additional cache and WebKit directories, ensuring a more thorough reset of the development environment.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b1690f20077f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.