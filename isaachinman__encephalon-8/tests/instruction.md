# Issue

**Title:** [MAR-2511] Preserve instruction file bytes

## Description

## Human summary

Rejects unsafe instruction files before Encephalon edits them and preserves every original byte outside the managed block, including BOMs and mixed line endings.

## Summary

This PR fixes MAR-2511 by making managed instruction-file preflight byte-preserving:

- reads existing `AGENTS.md` and `CLAUDE.md` files as raw bytes through verified no-follow descriptors
- rejects malformed UTF-8 with fatal decoding before either instruction file is changed
- rejects embedded NUL bytes with stable errors that do not echo file content
- adds a 1 MiB preflight size limit for existing instruction files
- stores original preflight bytes in instruction plans and compares current/backup state with `Buffer.equals`
- writes precomputed planned bytes rather than re-deriving bytes during publication
- preserves BOM bytes, LF, CRLF, mixed line endings, empty files, and no-final-newline content outside the managed span
- documents the managed instruction-file byte contract in the README and implementation plan

The tests cover overlong UTF-8, lone continuation bytes, truncated multibyte sequences, malformed surrogate encodings, embedded NULs, exact and over-limit file sizes, byte-for-byte add/remove round trips, and no-mutation behaviour for rejected inputs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f1ea9d4f7d57`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.