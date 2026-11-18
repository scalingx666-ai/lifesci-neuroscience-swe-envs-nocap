# Issue

**Title:** [MAR-2926] Make two Windows timing tests deterministic

## Description

## Summary

Two tests failed intermittently, only on `platform (windows-latest)`: one turned `main` red after the MAR-2918 merge ([run](https://github.com/isaachinman/encephalon/actions/runs/37965429794)) and the other failed PR #105 ([run](https://github.com/isaachinman/encephalon/actions/runs/37966618810)). Both depended on Windows timing; the same code passed on other runs. This makes each test's timing precondition explicit, without weakening what it checks.

## Root causes

- **`scripts/benchmark-command.test.ts`**: the descendant test killed its controller after a fixed 1 s timeout. On a slow Windows runner the controller can still be spawning its child at that moment. `taskkill /T` snapshots the tree before killing and can't pause the parent, so a child created after the snapshot survives. The POSIX path avoids this by stopping the controller with `SIGSTOP` before its snapshot.
- **`test/records.test.ts`** ("stable canonical snapshot retries a same-size replacement whose mtime is restored after graph validation"): detecting a same-size rewrite with a restored mtime requires the ctime to change. On Windows the rewrite can land in the same file-time tick as the setup, so the ctime stays the same and nothing observable changed. The failing run took 7.6 ms.

## Changes

- The descendant test has the controller write the descendant's pid once it is spawned. The test then aborts through the existing `signal` option, which runs the same `stop` and tree-termination path as the timeout, and asserts that the descendant process is gone (bounded wait) instead of racing a 2 s sentinel timer.
- The timeout path stays covered by a quick cross-platform check that a hanging command rejects with `timed out`.
- The records test retouches the file until its ctime differs (bounded to 1 s) and asserts that precondition before detection is exercised.

## Verification

- A mutation that kills only the controller makes the new descendant test fail (the descendant stays alive); the real implementation passes, repeatedly.
- `bun run lint`, `bun run typecheck`, `bun run build` and `bun run test:all` (909 tests: 906 passed, 3 platform skips) pass locally. Windows CI is the authority for the Windows-specific timing.

## Branch protection

`main` already requires every CI check plus Greptile, with branches up to date (`strict: true`). A PR can't merge against stale code, and #101's merge commit was identical to its tested head, so this red `main` came from flakiness. Admin bypass is still possible because `enforce_admins` is off.

## Encephalon

Adds workflow `72492e02-72bd-4477-8d0e-9bf7f3836a50` (`workflow.windows-timing-tests`).

## Linear

Closes [MAR-2926](https://linear.app/marcoappio/issue/MAR-2926).

<!-- greptile_comment -->

<!-- greptile_summary -->

<h2><a href="https://app.greptile.com/api/retrigger?id=77971957"><picture><source media="(prefers-color-scheme: dark)" srcset="https://greptile-static-assets.s3.amazonaws.com/badges/RetriggerDark.svg?v=2"><source media="(prefers-color-scheme: light)" srcset="https://greptile-static-assets.s3.amazonaws.com/badges/Retrigger.svg?v=2"><img alt="Retrigger" src="https://greptile-static-assets.s3.amazonaws.com/badges/Retrigger.svg?v=2" align="right"></picture></a>Confidence Score: 5/5</h2>

<!-- greptile-impact-verdict --> The PR appears safe to merge; no actionable issue was found.

<h3>Summary</h3>

This PR makes two Windows-sensitive tests wait for the conditions they need.
- Benchmark tests wait for descendants before checking tree cleanup.
- Record tests confirm a file change before checking the reader’s retry.

No actionable issues were found. This review checked the code paths; it did not run the tests.

<!-- greptile_confidence_score:5 -->

<sub>Reviews (1) · Last reviewed commit: ["\[MAR-2926\] Make two Windows timing tests..."]() · [Reviewed by Greptile](https://www.greptile.com/?utm_source=greptile_expert&utm_medium=github&utm_campaign=code_reviews&utm_content=isaachinman/encephalon)</sub>

<!-- /greptile_comment -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a8f6c73e5bc5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.