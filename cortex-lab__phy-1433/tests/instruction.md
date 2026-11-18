# Issue

**Title:** Add opt-in background lookahead for explicit trace navigation

## Description

TraceView and TraceImageView can now opt into background lookahead through a session-only “Background prefetch” action. Explicit left/right and wheel navigation hint the shared reader after the visible read; jumps, reversals, ownership changes, hide, and close withdraw obsolete hints. Waveform extraction, selection refreshes, and redraws generate no hints.

Stacked on #1432; merge that PR first. Implements the phy navigation follow-up to cortex-lab/phylib#69, alongside the recording support from cortex-lab/phylib#68. The dedicated integration job uses merged phylib commit ded47ba902b4470405138e8af7febd8d02094b1b. Released phylib remains supported without the optional action.

A small application adapter manages one hint owner across views, leaving caching, worker threads, and serialization in phylib. An accepted `closed` GUI event separates teardown from the vetoable save prompt. Cancelling closure preserves the session; closing one view never closes the shared reader. Permission is off initially and is not persisted. Lookahead uses a documented half-second horizon and no inactivity timer.

Validation:
- Full released-phylib suite: 658 passed, 7 skipped; lint and formatting passed.
- 29 focused tests passed with source phylib/SI, covering view navigation, GUI lifecycle, and application integration. After strengthening standalone menu-action assertions, all seven SI application tests passed again.
- Coverage includes read/hint ordering, ownership, bounds, old readers, hidden/closed views, cancelled closure, GUI recreation, actual SI warming, demand-only waveform access, and shutdown during active prefetch.
- Generated API docs and strict documentation checks passed with released phylib.

Visible reads remain synchronous: initial loads and arbitrary jumps can block, and demand can wait for one active backend call. Remote-recording latency has not been benchmarked; custom reader block durations receive best-effort hints.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `780ff17e1d3f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.