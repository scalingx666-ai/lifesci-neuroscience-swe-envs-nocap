# Issue

**Title:** [MAR-2919] Add opt-in diagnostics for CLI errors

## Description

## Summary

Setting `ENCEPHALON_DEBUG=1` makes the CLI print the error's stack, details and cause chain to stderr after the usual JSON error. Default output is unchanged.

## Problem

An unexpected failure reached users as "An unexpected internal error occurred." with exit code 1 and empty details, and IO errors also hid their causes. Nothing in the runtime offered a way to see the cause chain, so a bug report contained nothing actionable.

## Design

- `runCli` writes `util.inspect(error, { depth: 8 })` to stderr after the JSON error, only when `ENCEPHALON_DEBUG` is exactly `1`. Node's inspector already prints the stack, own fields such as `code` and `details`, and nested `[cause]` entries, so no custom formatter is needed. The depth matches the existing eight-level cause classification bound.
- Both CLI error paths (`EncephalonError` and unexpected errors) use it.
- Help text, the README and the contract describe the variable. The contract marks the diagnostic as local troubleshooting output that may include paths, not a consumer contract.

## Compatibility

Without the variable, stdout, stderr and exit codes are byte-for-byte unchanged. The library API never reads the variable or prints. No new dependencies.

## Verification

- New CLI test: with `ENCEPHALON_DEBUG=1`, a post-commit cache failure still writes its JSON error first, followed by the `EncephalonError` stack and its `[cause]`. Existing tests continue to parse the whole of stderr as a single JSON value without the variable.
- `bun run lint`, `bun run typecheck`, `bun run build`, `bun run check:generated` and `bun run test:all` (906 tests: 903 passed, 3 platform skips) pass locally.

## Encephalon

Adds decision `ae4f07c3-3111-4329-8023-026e46eabcd8` (`cli.debug-diagnostics`).

## Linear

Closes [MAR-2919](https://linear.app/marcoappio/issue/MAR-2919).

<!-- greptile_comment -->

<!-- greptile_summary -->

<h2><a href="https://app.greptile.com/api/retrigger?id=77747956"><picture><source media="(prefers-color-scheme: dark)" srcset="https://greptile-static-assets.s3.amazonaws.com/badges/RetriggerDark.svg?v=2"><source media="(prefers-color-scheme: light)" srcset="https://greptile-static-assets.s3.amazonaws.com/badges/Retrigger.svg?v=2"><img alt="Retrigger" src="https://greptile-static-assets.s3.amazonaws.com/badges/Retrigger.svg?v=2" align="right"></picture></a>Confidence Score: 5/5</h2>

<!-- greptile-impact-verdict --> The PR appears safe to merge; no actionable issues remain.

<h3>Summary</h3>

Adds CLI diagnostics after the usual JSON error when `ENCEPHALON_DEBUG=1`.
- Default output and help text remain unchanged.
- Tests cover expected errors, unexpected errors, and the exact opt-in value.
- The test runner clears inherited debug settings.
- The README warns readers to follow recovery instructions before safely repeating a command.
- All three unnumbered previous findings are addressed. No new actionable issues were found.

<!-- greptile_confidence_score:5 -->

<sub>Reviews (3) · Last reviewed commit:  · [Reviewed by Greptile](https://www.greptile.com/?utm_source=greptile_expert&utm_medium=github&utm_campaign=code_reviews&utm_content=isaachinman/encephalon)</sub>

<!-- /greptile_comment -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f457caaa9c3e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.