# Issue

**Title:** Fix 500 when setting whole-vault access for specific people

## Description

Access → Entire vault → Specific people failed with HTTP 500.

The vault branch of `clearResourceOverrides` (`permissions/access-management.ts`) passed three parameters but only referenced `$1` and `$3`; Postgres cannot infer a type for the unused `$2` and rejects the query (`42P18: could not determine data type of parameter $2`). The branch now numbers its audience parameter `$2`. Everyone, folder and file selections were unaffected.

Regression test added in `member-access-defaults.test.ts` (fails with the production error without the fix). All 8 access/share test files pass (96 tests); server tsc clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `310310c94140`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.