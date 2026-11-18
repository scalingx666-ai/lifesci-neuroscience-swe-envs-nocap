# Issue

**Title:** Show Add server and recent connections in account settings

## Description

Connection settings had no explicit Add server action, and the recent-connections selector disappeared when only one server was remembered. Show the selector for a single connection and add a button that clears and focuses the server address field. Saving still validates the address and switches through the existing single-active-server flow. Empty or equivalent current addresses cannot trigger a reconnect.

Validation: 15 connection/history/auth regression tests passed, desktop TypeScript check and Windows-target frontend build passed. Checked the real UI in macOS and Windows browser simulations, including Add server focus, empty/unchanged-address disabling, and narrow Windows layout. Native Windows was unavailable.

CI exposed a race in the existing shrink-brake integration test: it observed in-memory seed content before persistence completed and accepted the previous connection's synced flag as proof of readmission. Wait for persisted seed content and a server connection marked shrink-held before exercising the read-only assertion. The six-test shrink-brake suite passes locally with the corrected synchronization.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c0bd71feb9c4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.