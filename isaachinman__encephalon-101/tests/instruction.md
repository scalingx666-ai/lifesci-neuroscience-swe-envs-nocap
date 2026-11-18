# Issue

**Title:** [MAR-2918] Keep reads and unrelated adds working during head conflicts

## Description

## Summary

A merge that leaves two active heads for one kind/subject no longer blocks every read and every unrelated write. `validate` still reports the conflict, and an add to the conflicted group must still supersede every head.

## Problem

Canonical records are committed to Git. When two branches each supersede the same record, the merge produces two active heads. Until now, every `search`, `list`, `show`, `gather`, `prepare`, `init` and unrelated `add` then failed with `VALIDATION_FAILED`, so Encephalon was unusable for every agent in the repository until someone resolved the conflict by hand. The error details also dropped `recordId`, so an agent had to run `validate` to find which records to supersede.

## Design

- Validation keeps its complete, untruncated issue list alongside the bounded public result.
- Reads accept a corpus whose only issues are `MULTIPLE_ACTIVE_HEADS`. The verified corpus already marks every unsuperseded record as active, so conflicting heads are returned as active.
- Write planning blocks `MULTIPLE_ACTIVE_HEADS` only for kind/subject groups that contain a candidate record. Pre-existing conflicts elsewhere are tolerated; a partial resolver in the conflicted group still fails.
- `VALIDATION_FAILED` details include `recordId` where an issue has one.
- The generated-head allowance used by `init --refresh-baseline` is now covered by the general rule, so it is removed along with the unused `readRecordsAllowingGeneratedMultiHeads` helper.

## Compatibility

`validateRecords` results are unchanged, and the CLI `validate` still exits 2 on a conflict. Operations that previously failed only because of an unrelated conflict now succeed. `init --refresh-baseline` now reports a mixed generated/human conflict in `skippedConflicts` instead of failing, and leaves unrelated conflicts alone. Error details gain an optional `recordId` field. No cache schema, canonical format or public type changes.

## Verification

- New and updated tests cover reads (`list`, `search`, `show`), an unrelated add, a partial resolver whose error lists both conflicting `recordId`s, init beside an unrelated conflict, and both refresh cases. Error-precedence tests now use a missing supersession target, which still blocks.
- The new expectations fail against `main` and pass with this change.
- `bun run lint`, `bun run typecheck`, `bun run build`, `bun run check:generated` and `bun run test:all` (906 tests: 903 passed, 3 platform skips) pass locally.

## Encephalon

Adds decision `01e8c3ad-fb81-4e2f-b5a2-202fbd2b2624` (`canonical.active-head-conflicts`).

## Linear

Closes [MAR-2918](https://linear.app/marcoappio/issue/MAR-2918).

<!-- greptile_comment -->

<!-- greptile_summary -->

<h2><a href="https://app.greptile.com/api/retrigger?id=77745921"><picture><source media="(prefers-color-scheme: dark)" srcset="https://greptile-static-assets.s3.amazonaws.com/badges/RetriggerDark.svg?v=2"><source media="(prefers-color-scheme: light)" srcset="https://greptile-static-assets.s3.amazonaws.com/badges/Retrigger.svg?v=2"><img alt="Retrigger" src="https://greptile-static-assets.s3.amazonaws.com/badges/Retrigger.svg?v=2" align="right"></picture></a>Confidence Score: 5/5</h2>

<!-- greptile-impact-verdict --> The PR appears safe to merge; no blocking findings remain.

<h3>Summary</h3>

The PR keeps conflicting heads readable and lets unrelated adds continue. `validateRecords` still reports conflicts, and an add to a conflicted group must resolve every head.

- Blocking decisions use the complete issue list.
- `VALIDATION_FAILED` details now include available `recordId` values.
- The latest changes address the previous request for error-limit coverage.

<!-- greptile_confidence_score:5 -->

<sub>Reviews (2) · Last reviewed commit: ["\[MAR-2918\] Test blocking issues beyond t..."]() · [Reviewed by Greptile](https://www.greptile.com/?utm_source=greptile_expert&utm_medium=github&utm_campaign=code_reviews&utm_content=isaachinman/encephalon)</sub>

<!-- /greptile_comment -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `306f95bc869b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.