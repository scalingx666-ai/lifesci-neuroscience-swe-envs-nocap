# Issue

**Title:** Remove the C++ JNI sources brought back by a sync

## Description

### Summary
#10382 replaced the C++ JNI library with Rust and deleted `webknossos-jni/`. Resolving a sync conflict with the monorepo (scalableminds/mono#49) added the 15 files back with the synced commit of scalableminds/mono#47 (0a4c03f). This deletes them again. These files are the only difference between this repository and `webknossos/` in the monorepo.

**When merging, keep the `Mono-RevId` trailer at the end of the squash commit message.** Without it, the sync treats the deletion as a new commit here and conflicts again as soon as the monorepo moves (*Sync conflicts* in the monorepo's README.md, step 3).

### Steps to test
- `webknossos-jni/` is gone. Nothing references it since #10382.
- After merging, a sync run with `spoke: webknossos` reports up to date and closes scalableminds/mono#49.

### Issues
- scalableminds/mono#49

------
- [ ] Added changelog entry (not needed: restores the state of #10382)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

Mono-RevId: 04d00dd073c1307bd39cbf38c9fb433ca2dacb50

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `186744ab9052`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.