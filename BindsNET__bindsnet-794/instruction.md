# Issue

**Title:** Make network.reset_state_variables() actually reach the learning rules

## Description

Supersedes #777. Co-authored with @saachigoyall, who found and diagnosed the bug.

## What is wrong

`AbstractFeature.reset_state_variables` forwards the reset to `self.learning_rule`, and it is the only place that does. Every concrete feature overrode it with a bare `pass` and none called `super()`, so that forwarding line was unreachable.

The result: `network.reset_state_variables()` never reached any `MulticompartmentConnection` learning rule. Driving an MSTDPET connection for 250 steps and then resetting the network left **every** state variable untouched, including the two that `MSTDPET.reset_state_variables` already cleared.

On top of that, the rules themselves were incomplete. MSTDPET cleared 2 of its 6 variables (#777). MSTDP and PostPre cleared nothing at all.

## Changes

**`bindsnet/network/topology_features.py`**
- Drop the seven bare-`pass` overrides (`Probability`, `Mask`, `MeanField`, `Weight`, `Bias`, `Intensity`, `Degradation`) so they inherit the base implementation.
- Drop `@abstractmethod` from `AbstractFeature.reset_state_variables`, which is why those overrides existed in the first place. This only relaxes the contract: a subclass may still override.
- `AdaptationBaseSynapsHistory` and `AdaptationBaseOtherSynaps` keep their own reset logic and now chain to `super()` first.

**`bindsnet/learning/MCC_learning.py`**
- `MSTDPET` now also clears `p_plus`, `p_minus` and the moving-average buffer (@saachigoyall's change).
- `MSTDP` now clears `eligibility`, `p_plus`, `p_minus`, the moving-average buffer, and the fast path's one-step spike lag. That lag is newer than #777, and it matters: without clearing it the first step of an episode pairs with the last step of the previous one, which is exactly the cross-episode contamination #777 set out to fix.
- `PostPre` now clears both averaging buffers and their indices.
- `Hebbian` holds no state between steps; its no-op is now documented as deliberate rather than looking like an oversight.
- `MSTDP`'s lazily-built state (`_prev_source_s`, `_prev_target_s`, `eligibility`) is declared `None` in `__init__` and guarded with `is None` instead of `hasattr`, so reset has something well-defined to restore.

## Tests

Eight new cases in `TestLearningRuleReset`. **Seven of the eight fail against master**, so they genuinely pin the bug. The strongest one runs two identical episodes with a reset between them and requires identical resulting weights.

This replaces the test from #777, which passed `tc_plus` and `average_update` to `Weight`. `Weight.__init__` has a fixed signature that never accepted them, so that test raised `TypeError` rather than running, on master and on its own branch alike.

Full suite: **91 passed** (83 before). `black --check` and `isort` clean on the changed files.

## Performance

Reset runs once per episode, not per time step, so the added clearing is off the hot path. Two edits do touch the per-step update path (`hasattr` to `is None`), so I measured: three interleaved A/B rounds against master, MSTDP fast path, MSTDPET, and MSTDP dense path, at n=64 and n=256. All differences under 1% with the sign varying between rounds, i.e. no measurable change.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5f810b87b480`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.