# Issue

**Title:** Fix/integration awareness oauth guard

## Description

This pull request introduces several improvements to Google Workspace integration, OAuth handling, and the integrations catalog. The main changes expand Google OAuth scopes for broader functionality, improve credential lookup logic for Google Workspace, and enhance the integrations UI to clarify OAuth-only services. These updates help ensure that Google Workspace features are more robust and user-friendly, while also making OAuth flows clearer and easier for users.

**Google Workspace OAuth enhancements:**

* Expanded Google OAuth scopes to include additional productivity, communication, and AI-related APIs in `src-tauri/src/engine/oauth.rs` and updated documentation in `docs/oauth-app-registration.md`. This enables broader access to Google services such as Chat, Tasks, Contacts, Forms, YouTube, and Vertex AI. [[1]](diffhunk://#diff-a2650742966a878ff3650d02d518299297e7541faf2a3f882975748fd275d8c6L624-R664) [[2]](diffhunk://#diff-3bdebd92b2ead376def6b109861064aa7daee3d495032be1ad08c26e7e3f4391L81-R95)
* Set a default Google Workspace PKCE Client ID in `src-tauri/src/engine/oauth.rs`, allowing one-click OAuth sign-in without manual client ID setup.

**Credential lookup improvements:**

* Updated credential retrieval logic in `src-tauri/src/commands/mail.rs`, `src-tauri/src/commands/integrations.rs`, and `src-tauri/src/engine/tools/google.rs` to prioritize `oauth:google-workspace` and fallback to legacy `oauth:google`, ensuring compatibility for both new and existing users. [[1]](diffhunk://#diff-35a1a18001c8fa828bc03e55e7ecbfc22f09e188b40c4506c38934356267754cL433-R434) [[2]](diffhunk://#diff-b097d20ea754de284373e7c756d545ebdc1f7e27bcfcf1f38237c0d1c1feb357L240-R241) [[3]](diffhunk://#diff-56a6d39c7d2edf5401203f4a20270de132384c75917712e70265de6b9bb26cd5L35-R37)

**Integrations catalog and UI updates:**

* Defined OAuth-capable services and n8n OAuth delegation in `src/views/integrations/catalog.ts`, clarifying which services support one-click sign-in and which require n8n credential delegation.
* Updated Google Workspace catalog entry to indicate OAuth-only setup (no manual credential fields), preventing fallback to API key fields.
* Improved the setup guide UI in `src/views/integrations/setup-guide.ts` to display a clear message for OAuth-only services, informing users that no API keys are needed and to use the Connect button. [[1]](diffhunk://#diff-f1e90b49999558e3223a3bce1f3fa309957bdf7f2fd817b6d2dadfc10a9dd77aL99-R101) [[2]](diffhunk://#diff-f1e90b49999558e3223a3bce1f3fa309957bdf7f2fd817b6d2dadfc10a9dd77aR114-R125)

**Miscellaneous:**

* Enhanced the `dev:tauri:clean` script in `package.json` to clean additional directories and caches, ensuring a more thorough development environment reset.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ce5df09347c6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.