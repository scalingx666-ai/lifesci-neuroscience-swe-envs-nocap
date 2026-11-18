# Issue

**Title:** Hold a registry frame's pull while a renamed note is inside its grace window

## Description

Found while testing 0.1.69-staging.118 with the app open: renaming a note in the same second as editing another note produced a duplicate (new name registered as a new note, old name re-materialized from the server). One rename alone, two renames, and rename + symlink all paired correctly.

Cause: the edit's content push makes the server announce `registry-changed`; the debounced pull that frame arms was held only while a vanished folder was pending (#221), not while a note's delete was inside its 2.5 s grace window. The pull ran first and registered the rename's new half. Pre-dates #222: any server frame during the window had the same effect.

Fix: hold the frame's pull whenever `pendingDiskDeletes` is non-empty too; the drain re-arms it. New test in `docSessionBulkOrder.test.ts` fails without the change and passes with it. Full desktop suite 2443, typecheck clean. .

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3138f4310f86`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.