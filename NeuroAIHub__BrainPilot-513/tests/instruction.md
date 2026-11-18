# Issue

**Title:** fix(web): filter non-file artifacts from live demos

## Description

## What changed
- exclude Trace checkpoint pseudo-artifacts from Live Demo file collection
- deduplicate absolute and relative aliases by their canonical file-API path
- preserve the first real artifact spelling in the exported bundle
- add regression coverage for checkpoint metadata and duplicate workspace aliases

## Verification
- targeted Live Demo tests: 8 passed
- Web production build passed
- integrated repository build passed
- integrated test suite: 97 files / 1077 tests passed
- 208 Preview `test-ux-all-fixes-rc__3436f6d3`:
  - real Trace node contained `/workspace/demo_result.md`, `demo_result.md`, and `checkpoint:checkpoint_...`
  - generated Live Demo showed one real file and no checkpoint pseudo-file
  - console/network contained no file-read 404
  - exported JSON contained exactly one file, `/workspace/demo_result.md`, with `truncated=false`
  - 390px replay had no horizontal overflow

Kept as Draft for coordinated review. No merge or release action was taken.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `463d953e6764`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.