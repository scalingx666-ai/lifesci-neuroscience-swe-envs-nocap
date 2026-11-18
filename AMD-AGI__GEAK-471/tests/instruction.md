# Issue

**Title:** fix(interface): read SGLang dictionary startup identity

## Description

## Summary

SGLang startup logs that emit `server_args={...}` currently leave GEAK's observed server identity empty, making the same-configuration alignment comparison unavailable. Parse that format alongside `ServerArgs(...)`, preserving the existing identity field allowlist and scalar-value behavior.

Balanced delimiters handle wrapped records, quoted braces and nested unrelated values. Parsing caps the accumulated record at 64 KiB and contains malformed/deep AST input. No expressions are executed, and no argv is synthesized. This restores identity evidence; acceptance thresholds and benchmark decisions are unchanged.

## Test plan

- Alignment tests: 72 passed, including both startup formats, handoff identity verification, wrapped/quoted records, malformed keys, ignored fields, size limits and deep expressions.
- Exact L0 Python selection: 2,142 passed, 5 skipped, 90 subtests; local coverage 97.24% against the 97% gate.
- Remaining local L0 checks passed: shell syntax, expert-skill static validation, KB/workflow contracts, four Node regressions, skillset integrity, and dry-run mapping assertions.
- Ruff has the same 48 existing diagnostics as the base, with no new diagnostics. Local Node is 22.16.0; CI uses Node 20. Hosted CI also passed, including the secret scan and Node 20 checks.

## Related issues

. Companion Hyperloom consumer fix: AMD-AGI/Hyperloom#1558.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3c3eaac88dfb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.