# Issue

**Title:** CI: Test stable (deno), dev (deno) and legacy (node)

## Description

We were previously testing against the stable and dev versions of the NodeJS validator and only the dev version of the Deno validator.

This now tests against the stable and dev versions of the Deno validator and only the stable version of the NodeJS validator, reflecting the expectation that further development will be almost exclusively in the Deno validator.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7de1e8c569ae`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.