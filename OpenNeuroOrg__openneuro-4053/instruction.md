# Issue

**Title:** Report a login failure from the CLI as a readable error

## Description

.

Creating a dataset without valid credentials produced two unhelpful outcomes, both visible in the tracebacks on the issue.

First, `createDataset` stringified the whole GraphQL `errors` array, so the one line that matters, "You must be logged in to create a dataset.", was buried in a server side stacktrace.

Second, a response carrying `data.createDataset: null` with no top level errors made `createDataset` resolve to `undefined` despite its `Promise<string>` type. That only failed much later as `TypeError: Path must be a string, received "undefined"` from the `join(repoDir, datasetId)` in `upload.ts`, which points the user at a path problem rather than at their credentials.

Only the GraphQL messages are kept now. An authentication failure raises `LoginError` naming the command that fixes it, and a response with no accession number is rejected where it happens instead of turning into a path error later. `getLatestSnapshotVersion` shares the same handling. The upload command prints that message and stops rather than throwing an uncaught error.

Reverting `graphq.ts` and `upload.ts` gives 1 passed and 4 failed: the no accession number case resolved `undefined` without throwing, the missing credentials case gave a `ResponseError` instead of a `LoginError`, and both message filtering cases returned the raw JSON array. After, the full CLI suite is green at 41 passed across 12 steps, with `deno fmt` and `deno lint` clean.

One note for anyone running this locally. `cli/deno.json` has `"minimumDependencyAge": {"exclude": [...]}`, which deno 2.6.10 rejects with `Unsupported "minimumDependencyAge" object. Caused by: missing field 'age'`. I dropped the key locally to run the tests and restored it before committing, so this branch does not touch it. CI pins `deno-version: v2.x`, so this may start biting soon.

Disclosure: this change was prepared with AI assistance. I have reviewed and tested it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2ac78fce8a45`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.