# Issue

**Title:** Sidebar: Name (Z–A) and per-folder sort

## Description

Adds a third sidebar sort, **Name (Z–A)** (dated notes like 2026-09-23 newest first; folders reverse too), and a **per-folder sort** from a folder's right-click menu ("Sort this folder by": Vault default / Recently modified / Name A–Z / Name Z–A).

- A folder's sort applies to it and everything under it until a deeper folder sets its own. It replaces the base sort for that subtree; the drag-and-drop arrangement still sits on top.
- Device-local, per vault (`context.folderSort:<vaultPath>`); follows folder renames.
- Tests: 5 new in `lib/tree/__tests__/sort.test.ts`; desktop suite 2336 passed, tsc clean. CHANGELOG + 0.1.67 release note added.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e238d5bc7042`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.