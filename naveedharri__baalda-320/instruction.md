# Issue

**Title:** Remember recent servers and switch connections safely

## Description

The desktop previously required retyping server addresses, and changed the shared API client before retiring the previous vault's sync. Account settings now remembers the eight most recent server addresses and keeps one active server at a time.

Switching flushes pending local edits, stops the previous sync session, closes its vault, and clears the old bearer token before exposing the destination URL. The user then chooses a destination vault. Reconnecting to the same server retains the current folder. A failed configuration write leaves the API client unchanged; session tokens remain in the existing per-server OS keychain.

This implements the fast-switching alternative in #316. Concurrent sessions/background sync across servers remain out of scope: that requires separate API clients, session ownership and server-scoped vault/cache identities. Do not close #316 as if concurrent sync were implemented.

Validation:
- Final full desktop suite: 319 suites / 3,503 tests passed; 2 suites / 12 tests skipped.
- Focused auth, startup and sync tests pass, including token isolation, persistence failure, sync teardown ordering, flush failure, and same-server reconnect.
- TypeScript checking and Windows-target frontend build pass.
- Windows and macOS browser simulations inspected at normal and 720×600 widths; selecting a recent connection changes the draft without switching until Save & reconnect.
- Native Windows/WebView2 and a live two-server end-to-end test were not performed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0fe6519c3e8f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.