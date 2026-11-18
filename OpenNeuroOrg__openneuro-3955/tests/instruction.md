# Issue

**Title:** fix(cli): Align very long annex object extension (32+ character) behavior with git-annex

## Description

The CLI would calculate a different annex object path than git-annex if all extensions for a file was longer than 32 characters. Git-annex trims these to prevent excessively long filenames.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6dd7acdeec7f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.