# Issue

**Title:** Only add OriginalError to Airbrake notices if the message was cut

## Description

### Summary
. `ErrorHandling.notifyWithPrefix` reports `prefix + first 80 characters` of the message and passes the full message along, which is then added as an additional `OriginalError` entry of the notice. So far, this entry was added whenever the full message differed from the reported one. Because of the prefix, that was always the case, even for short messages that weren't cut at all (e.g., `Rebasing failed: Error: Cannot apply legacy action` got an extra `OriginalError: Error: Cannot apply legacy action`).

Now, the `OriginalError` is only added if the message is longer than the 80 characters used for grouping, i.e., if it was actually cut. The redundant param is still removed in both cases. Grouping is unchanged.

### Steps to test:
- `yarn test frontend/javascripts/test/libs/airbrake_notice_helpers.spec.ts` (the new tests fail with the old comparison).

### Issues:
-

------
- [ ] Added changelog entry (not needed, no user-facing change)
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e3fab751eacb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.