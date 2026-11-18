# Issue

**Title:** fix(cli): Commit the git-annex branch once instead of once per key

## Description

## Problem

`commitAnnexBranch` builds its commit inside the loop over annex keys, so it generates one commit per annexed file rather than one commit for the upload:

```ts
  for (const [key, _path] of Object.entries(annexKeys)) {
    ...
    builder.add(annexBranchPath, newAnnexLog)
    changes = true
    if (changes) {
      await builder.commit("git-annex", "[OpenNeuro CLI] Added annexed objects")
    }
  }
```

`CommitBuilder` accumulates updates and never clears them, so each of those commits rebuilds the tree over every entry added so far and rewrites a blob for each — roughly quadratic in the number of annexed files.

On a 65,558-file / 226 GB dataset (40,176 unique annex keys) the upload never completed: 4,404 of 40,176 commits after 8 hours, rate still degrading, no log output during the phase. Extrapolating the measured curve put completion at about two weeks.

This does not avoid a large final commit either — since `updates` is never cleared, the last commit already contains every entry. The per-key commits produce the same final tree plus 40,175 progressively larger intermediate rebuilds.

## Change

Move the commit after the loop, restoring the behaviour from before the `CommitBuilder` refactor in b31b943, where the loop only staged files and a single `git.commit` followed it.

Whitespace-only for the body of the block; the diff is easier to read with `?w=1`.

## Testing

- `deno test` — 36 passed, 0 failed
- `deno fmt --check` and `deno lint` clean on the changed file (the 3 pre-existing lint warnings in `git.ts` are unchanged)
- Verified end to end on the dataset from #4047:

```
commits added by this run:      1        (was 40,176)
entries in that commit's tree:  40,179   = 40,176 key logs + activity.log, remote.log, uuid.log
```

The commit phase now completes in seconds, and the upload proceeds through the transfer phase normally — all 40,176 objects transferred, 0 failures. The dataset is published at ds008547.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2ac78fce8a45`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.