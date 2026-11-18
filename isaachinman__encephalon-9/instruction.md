# Issue

**Title:** [MAR-2512] Quarantine instruction deletions

## Description

## Human summary

Makes `init --remove` delete only the exact instruction file it inspected, so concurrent replacements are left intact instead of being removed accidentally.

## Summary

This PR fixes MAR-2512 by making managed instruction-file deletion race-safe:

- records the device/inode identity of preflighted instruction files
- adds a quarantine-and-verify deletion path for `delete` plans
- renames the delete candidate to a same-directory quarantine path before unlinking it
- verifies the quarantined file still matches the preflight identity and bytes
- restores an unverified quarantined replacement when verification fails
- restores quarantined files when a post-verification unlink failure would otherwise leave the public path absent
- removes the bare `rmSync(path)` deletion after detached validation
- adds deterministic deletion fault hooks for validation, quarantine, verification, and final unlink windows
- preserves replacement files created before deletion, after quarantine, or after verification
- saves the MAR-2512 review lesson in Encephalon workflow memory so future deletion-quarantine fixes test the final unlink window

The tests cover regular-file replacement, symlink replacement, directory replacement, a different file with identical bytes, replacement after global validation, replacement immediately before deletion, replacement after quarantine, replacement after verification, and restoration after a final unlink failure.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b8a2d3e2afad`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.