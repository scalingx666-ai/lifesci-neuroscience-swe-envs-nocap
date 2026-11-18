# Issue

**Title:** Isolate e2e tests from local dev server

## Description

### Summary
 - The end-to-end tests (e.g. `yarn refresh-snapshots`) are now run with different ports and fossildb data dir so that they can run in parallel with a local dev server.
 - It’s still a little brittle: if the e2e tests recompile they might mess up the shared target directory. I had no problems locally. A separate target directory would mean way less nice caching. Also, redis is fully shared, but that should not interfere.
 - binaryData dir is also still shared. the e2e tests only use Organization_X anyway
 - Also the e2e tests now ignore the application.local.conf (local developer config overrides)

### Steps to test:
- `yarn start` in one terminal, open wk in the browser, annotate some
- `yarn refresh-e2e-snapshots` in another terminal, should succeed
- refresh the browser tab, annotation should still be usable

------
- [x] Considered [common edge cases](../blob/master/.github/common_edge_cases.md)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3f0b73213a8a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.