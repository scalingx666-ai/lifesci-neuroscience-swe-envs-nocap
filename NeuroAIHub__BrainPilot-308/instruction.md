# Issue

**Title:** feat(web): FileSidebar 支持删除文件/目录

## Description

## Summary

- Wire the existing `api.sandbox.deleteFile` into the main file tree (`FileSidebar`): row-level trash (hover/focus, same pattern as `QuotaFileManager`) and multi-select batch delete next to download.
- Block deletes of `/workspace` and `/data` roots; on success remove the node from the tree, prune selection/expanded state, and close preview if the open path was under the deleted subtree.
- Fix mock `deleteFile` to keep `fileEntries`/`fileContents` in sync (including descendants); add zh/en i18n and unit tests for helpers + mock FS delete.

## Test plan

- [x] `npm test -- src/__tests__/fileSidebarDelete.test.ts` in `packages/web` (6 tests)
- [ ] Mock/local UI: open Files sidebar → hover a file → Delete → confirm → row disappears
- [ ] Delete the currently previewed file → preview closes
- [ ] Multi-select ≥1 items → Delete in header → confirm count → selected items gone
- [ ] Confirm no trash on `/workspace` / `/data` tier headers
- [ ] Delete a folder → children gone (recursive runtime `rm`)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0ba0f17d861f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.