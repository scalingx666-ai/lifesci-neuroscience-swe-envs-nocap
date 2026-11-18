# Issue

**Title:** Keep sync state and note selection isolated across vault switches

## Description

Switching vaults while a registry request was pending could let the old request resume against the new vault, materializing the wrong paths and persisting foreign note IDs in its baseline. Resetting a shared registry was insufficient because the next session rebound that same object to a live scope.

Each sync lifetime now gets a fresh registry, and teardown permanently retires the old one and detaches its listeners. Enable captures its registry and checks its scope after local priming; late progress and finalizers cannot update the new session. Vault switching flushes the editor before changing its epoch and clears selection. A late note-open response cannot clear another vault's pending selection, even when both paths match.

Access notifications also use the beginning of a listing as their cutoff, preventing notes created during a slow paginated listing from being mislabeled as permission grants.

Validation:
- All four new race/notification regressions fail against the previous staging sources and pass with the patch.
- Full desktop suite: 3,507 passed, 12 gated tests skipped, 320 suites passed.
- TypeScript check and Windows-target frontend production build passed.
- macOS and Windows browser simulation: switching away from a selected note clears the editor, tabs, and sync badges. The destination uses the simulator's setup flow; this is not a native multi-vault sync test.

No server schema or protocol changes. Installed production desktop validation and release remain outstanding.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f2c80cd3bf02`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.