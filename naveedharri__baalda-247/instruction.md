# Issue

**Title:** Activity: badge clears on read, review banner shows once, Clear button

## Description

## Problems
- The Activity badge stayed at **99+** after opening the panel. Read rows were kept as a list of ids capped at 1,000, so a burst bigger than the cap could never be fully read.
- The review banner ("N changes to review") came back on **every launch and vault switch**. Saved review items were re-recorded on open with a fresh timestamp, so they counted as new (unread again) and re-raised the banner. Dismiss never touched the saved copy.
- There was no way to clear the Activity list.

## Changes
- `markAllRead` rebuilds the read ids from the current feed (bounded by the feed, not history; cap 5,000). Only a feed too big to list moves the watermark instead.
- `reconcileReport.record` takes `{ at, seeded }`. Re-seeded review items keep their original time and are flagged `seeded`, and the banner announces only this session's new items.
- Activity → **Clear** (with confirm): hides every row up to now on this device (per-vault watermark) and marks pending reviews `skipped`. Nothing is deleted; new activity still shows.

## Release
Version bump to 0.1.72 (silent release).

## Tests
- Desktop suite green. New `activityClear.test.ts`; `activityUnread.test.ts` updated for the burst case.
- One flaky live-preview video test passes on rerun.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1193fbf46ca5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.