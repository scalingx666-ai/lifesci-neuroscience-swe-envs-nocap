# Issue

**Title:** fix: Thread userInfo correctly in updatePublic mutation

## Description

The updatePublic mutation was passing the user ID instead of userInfo to the `datalad/dataset.ts:updatePublic()` function.

Bug was identified because I attempted to write a script to set a dataset private using the graphql api and then tag the S3 objects as private. I got the following error:

```json
{
  "message": "DatasetEvent validation failed: userId: Path `userId` is required.",
  "locations": [{ "line": 2, "column": 3 }],
  "path": ["updatePublic"],
  "extensions": {
    "code": "INTERNAL_SERVER_ERROR",
    "stacktrace": [
      "ValidationError: DatasetEvent validation failed: userId: Path `userId` is required.",
      "    at Document.invalidate (/srv/.yarn/cache/mongoose-npm-8.9.5-46ee8d4aeb-74f38844ef.zip/node_modules/mongoose/lib/document.js:3334:32)",
      "    at /srv/.yarn/cache/mongoose-npm-8.9.5-46ee8d4aeb-74f38844ef.zip/node_modules/mongoose/lib/document.js:3095:17",
      "    at /srv/.yarn/cache/mongoose-npm-8.9.5-46ee8d4aeb-74f38844ef.zip/node_modules/mongoose/lib/schemaType.js:1407:9",
      "    at process.processTicksAndRejections (node:internal/process/task_queues:85:11)"
    ]
  }
}
```

Given that catching issues like this was part of the point of switching to a typed schema generator, I first updated the type annotation to verify that we get the correct error before fixing. I then also annotated neighboring functions, which identified minimal errors in the tests only.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6f24882aefe4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.