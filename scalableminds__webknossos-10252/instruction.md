# Issue

**Title:** Regenerate Slick tables when schema.sql changed since the last codegen

## Description

### Summary
- Feature-branch builds in CI restore `target/` from the branch's previous build, including the Slick-generated `Tables.scala`. The codegen only re-ran if the refresh stamp written by `dbtool.js` was newer than its own stamp, and in CI no refresh stamp exists. So after a schema change came in (e.g., via merging master), the build kept the old tables and logged "Slick SQL schema already up to date."
- The resulting Docker image had the new `schema.sql` but the old tables. Example: #9986 after merging #10193, whose dev instance failed on every datastore query with `column "isscratch" does not exist`. The backend tests don't notice, because their job refreshes the schema before testing.
- Fix: the codegen stamp now stores the hash of the `schema.sql` it was generated for, and a different hash triggers the codegen too. Locally, nothing changes: after pulling a schema change without refreshing the DB, the codegen runs once more against the unchanged DB (about a second), and refreshing the schema still triggers it as before.

### Steps to test:
- CI of this PR: the build job restores master's cache, whose stamp has no hash yet, so its log should show "Updating Slick SQL schema from local database...".
- Locally: compile, then compile again ("Slick SQL schema already up to date."), then write anything into `target/scala-*/src_managed/slick-schema-codegen.stamp` and compile again: the codegen runs and the stamp holds the hash again.

### Issues:
- dev instance of #9986 failed after merging master

------
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `597b5a5fa363`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.