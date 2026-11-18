# Issue

**Title:** [MAR-2929] Make concurrent-change tests independent of file-time resolution

## Description

## Summary

`main` went red again after the MAR-2920 merge ([run](https://github.com/isaachinman/encephalon/actions/runs/38010598564)). Two more Windows-only tests reported a missing expected exception, the same class of flakiness MAR-2926 fixed in one test. This PR finds every test that depends on file-time resolution and fixes them all, so the class can't keep turning `main` red.

## Cause

Tests that simulate a concurrent change inside a hook assume the change alters file metadata. On Windows that isn't guaranteed:
- writes within one clock tick can get identical file times;
- directory sizes are always 0, so adding, removing or renaming an entry is only visible through the directory's mtime.

Same-size rewrites, identical rewrites repeated on each retry, and directory entry changes can therefore be invisible, and whether a test passes depends on timing.

## Finding the whole set deterministically

- Ran the full suite with `TMPDIR` on an HFS+ disk image (1-second file times; hard links and symlinks still work). Every in-place-change test then hits the coarse-timestamp case on every run.
- Ran it again with a throwaway local change that ignores directory size, as Windows effectively does, to expose directory-entry cases. HFS+ directory sizes change with their entries and would otherwise hide them.

Together these found 17 timestamp-dependent tests: 15 file cases and 2 directory cases. That includes both tests that failed on `main` today.

## Changes

`test/helpers.ts` gains two helpers:
- `mutateObservably(path, mutate)` runs the simulated change and moves the mtime of the file, or of the parent directory for entry changes, past every earlier value.
- `restoreTimesWithNewCtime(path, atime, mtime, previousCtimeNs)` is for tests that deliberately restore mtime after rewriting: it waits until the ctime really differs (bounded to 3 s).

The 16 affected tests in records, cache, init, performance and artifact-inspection use them. MAR-2926's inline ctime loop now uses the shared helper. Production code is unchanged.

The 17th, "accepts a ctime-only retained-metadata change after deletion quarantine", is left alone: it is already skipped on Windows and only fails on HFS+.

## Verification

- On the HFS+ volume, the suite went from 17 failures to only these HFS+-specific ones, none of which apply to Windows CI:
  - "accepts a ctime-only retained-metadata change after deletion quarantine" (skipped on Windows);
  - "keeps canonical outputs identical across process locale settings" (HFS+ normalises filenames to NFD);
  - "prepared operation sessions reuse stable files…" (HFS+ hard-link inode numbering).
- The same holds with the directory-size simulation.
- `bun run lint`, `bun run typecheck`, `bun run build`, `bun run check:generated` and `bun run test:all` (859 tests: 856 passed, 3 platform skips) pass normally.

## Encephalon

Supersedes `workflow.windows-timing-tests` with `24c7041a-0e58-468a-a386-d54d15160b39`, which adds the helpers and the HFS+ enumeration method.

## Linear

Closes [MAR-2929](https://linear.app/marcoappio/issue/MAR-2929).

<!-- greptile_comment -->

<!-- greptile_summary -->

<h2><a href="https://app.greptile.com/api/retrigger?id=78330570"><picture><source media="(prefers-color-scheme: dark)" srcset="https://greptile-static-assets.s3.amazonaws.com/badges/RetriggerDark.svg?v=2"><source media="(prefers-color-scheme: light)" srcset="https://greptile-static-assets.s3.amazonaws.com/badges/Retrigger.svg?v=2"><img alt="Retrigger" src="https://greptile-static-assets.s3.amazonaws.com/badges/Retrigger.svg?v=2" align="right"></picture></a>Confidence Score: 5/5</h2>

<!-- greptile-impact-verdict --> The PR appears safe to merge; no blocking issues were found.

<h3>Summary</h3>

The PR makes simulated file changes visible even when file timestamps have low precision. Production code is unchanged.
- Concurrent-change tests make edits visible across file-time resolutions.
- Workflow notes capture Windows timing and JSON formatting lessons.

<!-- greptile_confidence_score:5 -->

<sub>Reviews (2) · Last reviewed commit: ["\[MAR-2929\] Format the superseding Enceph..."]() · [Reviewed by Greptile](https://www.greptile.com/?utm_source=greptile_expert&utm_medium=github&utm_campaign=code_reviews&utm_content=isaachinman/encephalon)</sub>

<!-- /greptile_comment -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a6a71e04b0f8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.