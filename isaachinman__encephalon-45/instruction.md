# Issue

**Title:** [MAR-2570] Verify repository identity files

## Description

## Human summary

Repository discovery now verifies Git markers, worktree targets, and package manifests through bounded filesystem identities, so concurrent path replacement or unsafe files cannot silently change which repository or installation Encephalon trusts.

## Summary

- Read Git marker files and package manifests through bounded, no-follow regular-file descriptors with fatal UTF-8 decoding and stable metadata checks.
- Capture and revalidate filesystem-directory generations across native realpath resolution, parent ascent, Git proof, package discovery, and root-installation verification.
- Cache the executing package identity only after its manifest and exact canonical directory generation are verified, while reverifying the installed package on every repository resolution.
- Require worktree targets to be non-empty and NUL-free while continuing to support legitimate absolute administration directories outside the worktree.
- Preserve actionable `INVALID_REPOSITORY`, `ROOT_INSTALL_REQUIRED`, and `IO_ERROR` classifications without leaking unsafe paths or file contents.
- Build the CLI once before the concurrent Node test suite to avoid test-induced directory-generation replacement.
- Add deterministic replacement, mutation, malformed-input, size-bound, UTF-8, symlink, worktree, memoisation, and error-policy coverage.
- Document the maintained repository-input and directory-generation contract.

## Validation

- `bun run test`: 238/238, twice consecutively
- `bun run lint`
- `bun run typecheck`
- `bun run benchmark`
- `bun run benchmark:check`
- `bun run build`
- `bun run check:package`
- `bun run check:publish`

Linear: https://linear.app/marcoappio/issue/MAR-2570/repository-read-git-and-package-markers-through-bounded-verified

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1c2c85947a47`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.