# Issue

**Title:** fix(cli): Log the underlying error when a file cannot be stat'd

## Description

## Summary

`add()` discards the error from `stat()` and always reports a broken symlink. Any failure that is not a filesystem problem is therefore reported as an inaccessible file, once per file in the dataset, with no way to recover the real cause.

This is what made #4040 hard to diagnose. The worker's `setup` message was being dropped (fixed separately in #4035), so `context` was undefined and `context.fs` threw a `TypeError`. `stat()` never ran. The output was 65,558 copies of:

```
<path> could not be added, check if this file is accessible and not a broken symlink.
```

for a dataset containing no symlinks and no unreadable files. The actual error was:

```
TypeError: Cannot read properties of undefined (reading 'fs')
    at add (cli/src/worker/git.ts:182)
```

## Change

Log the underlying error at `error` level before the existing message.

The per-file `console.log` is left exactly as it is, so there is no change to normal output or to the behaviour anyone currently relies on. Because the default log level is `ERROR`, the underlying error is visible without needing `OPENNEURO_LOG`.

## Testing

- `deno test` — 36 passed, 0 failed
- `deno fmt --check` and `deno lint` clean on the changed file (the 3 pre-existing lint warnings in `git.ts` are unchanged)
- Verified against the environment from #4040: with the swallowed `TypeError` reproduced, the real cause is now printed instead of being silently converted into a symlink message

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6678b50ea6f5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.