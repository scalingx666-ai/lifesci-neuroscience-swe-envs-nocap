# Issue

**Title:** fix(web): disable empty Trace demo playback and unclip speed controls

## Description

## Summary

- : empty Trace demos (`0/0` nodes) no longer look playable.
- Play, Previous, Next, Restart, timeline slider, and speed buttons disable when `nodeCount === 0`.
- Trace panel shows `demo.trace.empty` via `TraceGraphView` empty state.
- Slider exposes step semantics (`aria-valuenow` / `aria-valuetext` as step counts, not ms timestamps).
- Transport CSS uses `flex-wrap` so 1×/2×/4×/8× remain visible on narrow panels (390px+).

## Test plan

- [x] `packages/web` unit tests: `demoPlayback.test.ts` (empty controls, slider a11y, CSS wrap)
- [x] `tsc -b` for web package
- [ ] Manual: import/generate a demo with no Trace nodes — transport disabled, empty copy visible
- [ ] Manual: demo with nodes — scrub by step, speed buttons all visible at narrow width

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7f655f48aa69`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.