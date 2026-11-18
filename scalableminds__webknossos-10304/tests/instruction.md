# Issue

**Title:** Accept number as well as bigint for segment ids in the frontend API

## Description

### Summary
Since the full uint64 support (#9765), all segment-id parameters of the frontend API only accepted `bigint`, so scripts passing plain numbers (like the `labelVoxels(…, 1337)` doc example) didn't type-check. These parameters now accept `number | bigint` and are converted to `bigint` right at the start of each method; return types stay `bigint`.

Affected: `api.tracing.registerSegment`, `getSegment`, `updateSegment`, `removeSegment`, `loadAgglomerateSkeletonForSegmentId`, `setActiveCell`, and `api.data.labelVoxels`, `loadPrecomputedMesh`, `computeMeshOnDemand`, `setMeshVisibility`, `removeMesh`, `getSegmentColor`, `setSegmentColor`.

- Non-integer numbers throw the native `RangeError` from `BigInt()`.
- The JSDoc notes that ids above `Number.MAX_SAFE_INTEGER` must be passed as `bigint`.
- The cross-origin API forwards raw ids to these methods and now benefits from the conversion, too.

### Steps to test:
- Open a volume annotation and run e.g. `api.tracing.setActiveCell(5)` and `api.data.labelVoxels([[x, y, z]], 7)` in the console; both should work as with `5n` / `7n`.

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Removed dev-only changes like prints and application.conf edits

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f7d3a02ad254`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.