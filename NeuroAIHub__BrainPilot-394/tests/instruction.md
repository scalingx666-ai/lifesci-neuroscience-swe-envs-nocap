# Issue

**Title:** feat(plugins): add marketplace control plane

## Description

Stack 2/5. Depends on the plugin SDK PR.\n\nAdds disk-backed marketplace sources, immutable releases, install/enable/disable/update/rollback/uninstall lifecycle APIs, SHA-256 verification, dependency/conflict checks, and local or HTTPS registry support.\n\nValidation: backend 204 tests pass in the complete stack; focused control-plane tests cover real update and rollback.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3b1b27b338bc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.