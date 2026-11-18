# Issue

**Title:** fix(web): distinguish empty Trace from filter no-match

## Description

## Summary

- When Trace total is **0/0**, show an explicit “no nodes produced yet” empty state (with next-step guidance) instead of “No trace nodes match the current filters.”
- Keep filter no-match copy only when the corpus is non-empty but filters/playback hide all nodes.
- Disable and de-emphasize filter + layout controls when they have no effect; layout toggles expose selection with `aria-pressed`.

## Test plan

- [x] `packages/web` vitest (301 tests, including 12 new #317 tests)
- [x] `packages/web` `tsc --noEmit`
- [ ] Manual: session with empty Trace → graph shows empty-corpus copy, not filter mismatch
- [ ] Manual: filter a non-empty Trace to zero → still shows no-match
- [ ] Manual: empty corpus → search/status/type/layout disabled; refresh still works
- [ ] Manual: layout buttons report `aria-pressed` for active direction

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `57b45b9e3043`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.