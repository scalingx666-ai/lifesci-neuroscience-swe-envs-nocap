# Issue

**Title:** Use ApiResult for mesh-related REST API functions in frontend (3/n)

## Description

### Summary
Continues the `ApiResult` migration (#9890, #10086): converts the mesh-related REST functions to return `Promise<ApiResult<T>>` (with automatic retries):
- `getMeshFilesForDatasetLayer`
- `getMeshFileChunksForSegment`, `getMeshFileChunkData` (`admin/api/mesh.ts`; the previous retry timing of 2s/4s/8s is kept)
- `computeAdHocMesh`, `getBucketPositionsForAdHocMesh`

**Why:** `getMeshFilesForDatasetLayer` threw when the datastore was unreachable (`Failed to fetch`). It is called from the `maybeFetchMeshFiles` saga, which runs in a `takeEvery` handler for every `MAYBE_FETCH_MESH_FILES` action (context menus, proofreading, ...). The error crashed the root saga ("Root saga crashed"), so saving and proofreading stopped until the page was reloaded. In addition, the pending deferred for the layer was never settled, so everything waiting for the mesh files would have hung forever.

**Behavior now:**
- `maybeFetchMeshFiles`: if the request fails, the user is notified by the API function, the waiting callers get an empty list and the failed request is not cached (the next request tries again).
- `precomputed_mesh_saga`: chunk listing and chunk data keep their existing error handling (`unwrapOrThrow` inside the existing try/catch blocks, same toasts as before).
- `ad_hoc_mesh_saga`: a failing segment index request now stops loading that mesh (and removes the empty mesh entry) instead of throwing out of the saga. The retry loop around `computeAdHocMesh` was replaced by retry options with the same backoff as before (5 attempts, waiting 10s, 20s, 40s, 80s). After the last attempt, the error is reported once (previously after each attempt) and the chunk is skipped as before. Errors while adding a received chunk to the scene are caught and reported without refetching the chunk.

### Steps to test:
- Open an annotation with a segmentation layer that has a mesh file, go offline (or stop the datastore) and open a context menu / load a mesh. Previously, "Root saga crashed" appeared. Now, an error toast should be shown and the page should keep working.
- Go back online and load a mesh again. The mesh files and meshes should load.
- Check that precomputed and ad-hoc meshes still load normally (also for annotations with a segment index).
- Automated: new tests in `test/sagas/meshes/precomputed_mesh_files.spec.ts`, `yarn test` passes.

### Issues:
- contributes to #9552
- found while debugging a collaborative proofreading report ("Root saga crashed" with `Failed to fetch`)

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `66407150ff79`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.