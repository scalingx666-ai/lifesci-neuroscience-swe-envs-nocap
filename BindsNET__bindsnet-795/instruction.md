# Issue

**Title:** Fix MSTDP reset crashing when called before the first run

## Description

, which introduced this. My fault, caught while merging master into another branch.

## The bug

`MSTDP` builds `p_plus` and `p_minus` lazily inside `_connection_update`, because only the first update knows the batch size and device. #794 made `reset_state_variables` zero them unconditionally, so this raised:

```
AttributeError: 'MSTDP' object has no attribute 'p_plus'
```

...on any `network.reset_state_variables()` called before the first `network.run()`. Building a network and resetting it before the first episode is a normal thing to do, so this was reachable, not theoretical.

`MSTDPET` was never affected: it builds both in `__init__`. `PostPre` was never affected either.

## The fix

Declare `p_plus` and `p_minus` as `None` in `MSTDP.__init__` alongside the other lazily-built state (`_prev_source_s`, `_prev_target_s`, `eligibility`), switch the update path's `hasattr` guards to `is None` so both spellings agree, and have the reset skip whatever has not been built yet.

## Test

New case parametrised over MSTDP, MSTDPET and PostPre: build a network, reset it before running, assert no exception. It fails for MSTDP without the source change and passes with it.

Full suite: 94 passed. `black --check` clean.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f12870f17b11`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.