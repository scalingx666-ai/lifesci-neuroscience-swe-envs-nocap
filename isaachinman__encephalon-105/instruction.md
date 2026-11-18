# Issue

**Title:** [MAR-2922] Correct post-commit recovery text and document CLI arguments

## Description

## Summary

After an add whose cache rebuild fails, the recovery action now says not to retry the add. The contract now documents two CLI forms that have always worked: a positional `show` ID and unquoted multi-word `search` queries.

## Problem

- When the post-commit cache rebuild failed, the recovery action said "Run prepare to rebuild disposable cache state, then validate before retrying this add." The record is already committed, so retrying fails with `RECORD_EXISTS` or `MULTIPLE_ACTIVE_HEADS`, and an agent following the text literally would try it.
- `search` joins several positional arguments with spaces and `show` accepts a positional ID, but the contract said `search` takes one query argument ("Quote a multi-word search into one argument") and `show` requires `--id`.

## Design

- The `cacheHydration` recovery action becomes "Do not retry this add. Run prepare to rebuild disposable cache state, then validate."
- Callers may already rely on the tolerant CLI behaviour, so the contract documents it rather than rejecting input that works today. The CLI table and argument guidance describe both forms; the README examples keep the explicit `--id` form.

## Compatibility

The CLI and API behave the same; only the `cacheHydration` recovery text changes. The published-0.3.0 compatibility probes don't cover that text.

## Verification

- The successful-commands CLI test now also covers `show <id>` and an unquoted two-word `search`. The post-commit tests assert the new recovery text.
- `bun run lint`, `bun run typecheck`, `bun run build`, `bun run check:generated` and `bun run test:all` (905 tests: 902 passed, 3 platform skips) pass locally.

## Linear

Closes [MAR-2922](https://linear.app/marcoappio/issue/MAR-2922).

<!-- greptile_comment -->

<!-- greptile_summary -->

<h2><a href="https://app.greptile.com/api/retrigger?id=77775246"><picture><source media="(prefers-color-scheme: dark)" srcset="https://greptile-static-assets.s3.amazonaws.com/badges/RetriggerDark.svg?v=2"><source media="(prefers-color-scheme: light)" srcset="https://greptile-static-assets.s3.amazonaws.com/badges/Retrigger.svg?v=2"><img alt="Retrigger" src="https://greptile-static-assets.s3.amazonaws.com/badges/Retrigger.svg?v=2" align="right"></picture></a>Confidence Score: 5/5</h2>

<!-- greptile-impact-verdict --> The PR appears safe to merge; no actionable issues remain.

<h3>Summary</h3>

Corrects recovery advice after an add commits but its cache rebuild fails. Documents existing positional `show` IDs and multi-word `search` arguments.
- Adds CLI coverage for both forms and dash-prefixed search words after `--`.
- Updates post-commit error expectations.
- Adds a review record with the CLI documentation lesson.
- The previous unnumbered finding is fixed: the contract now requires `--` when any query argument begins with a dash.

<!-- greptile_confidence_score:5 -->

<sub>Reviews (4) · Last reviewed commit:  · [Reviewed by Greptile](https://www.greptile.com/?utm_source=greptile_expert&utm_medium=github&utm_campaign=code_reviews&utm_content=isaachinman/encephalon)</sub>

<!-- /greptile_comment -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d07da62f4d46`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.