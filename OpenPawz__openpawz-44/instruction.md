# Issue

**Title:** Fix/integration awareness oauth guard

## Description

This pull request introduces enhancements to the integration pipeline preflight checks, improves OAuth service configuration reporting, and adds comprehensive test coverage for MCP client utilities. The most impactful changes are the addition of a preflight validation command for integrations, improvements to OAuth service readiness reporting, and expanded tests for MCP content extraction and protocol constants.

Integration pipeline validation:

* Added `engine_integration_preflight` command in `src-tauri/src/commands/integrations.rs` to proactively validate integration pipeline readiness, including checks for OAuth service registration, Google scopes, tool definitions, alias routing, and n8n engine availability.

OAuth service configuration and reporting:

* Updated `OAuthServiceInfo` struct in `src-tauri/src/commands/oauth.rs` to include a `configured` boolean, indicating whether the OAuth client ID is properly set up, allowing the frontend to hide the OAuth button and prompt for manual setup if needed.
* Modified `engine_oauth_services` logic to set `configured` based on actual client ID for shipped PKCE services, and always true for dynamic registration and n8n delegation tiers. [[1]](diffhunk://#diff-b5d07b8e346a86acbb3b5c29b512f3bd2d0fdc8581019af41f7343f548c95f71R38-R39) [[2]](diffhunk://#diff-b5d07b8e346a86acbb3b5c29b512f3bd2d0fdc8581019af41f7343f548c95f71R51) [[3]](diffhunk://#diff-b5d07b8e346a86acbb3b5c29b512f3bd2d0fdc8581019af41f7343f548c95f71R70) [[4]](diffhunk://#diff-b5d07b8e346a86acbb3b5c29b512f3bd2d0fdc8581019af41f7343f548c95f71R89)
* Made `oauth_service_to_n8n_node` function public for broader access within the crate.

Testing and MCP client improvements:

* Added extensive tests to `src-tauri/src/engine/mcp/client.rs` covering edge cases for `extract_text_content`, protocol version, tool call timeout, and maximum tools per server.
* Updated `ToolCallResult` in `src-tauri/src/engine/mcp/types.rs` to serialize `is_error` as `isError` for improved frontend compatibility.

Build and development script enhancements:

* Improved the `dev:tauri:clean` script in `package.json` to remove additional cache and WebKit directories, ensuring a more thorough clean slate for development.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d8319396eee4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.