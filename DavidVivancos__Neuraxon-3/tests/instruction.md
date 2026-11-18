# Issue

**Title:** NXAnt: remove the wall-clock deadline from the consensus verify path

## Description

.

`Node.verify()` passes a **wall-clock deadline** into `mining_walk()`, which breaks out of the walk loop on `time.time()`. Because the walk's best score *is* the consensus value, two nodes that spend different amounts of wall-clock time on the same submission truncate at different steps and compute different scores.

This contradicts the guarantee stated in the program's own banner —

> *Pure-integer trinary CA (no floats) -> exact cross-node determinism. Every node re-runs the anti-attractor WALK, recomputes the integer score, applies the validity rules, and must agree.*

— and in `mining_walk`'s docstring, *"Deterministic from K12(pubkey||nonce)."* The integer/no-float discipline achieves determinism everywhere **except** this one wall-clock branch.

## The change

```diff
-        best_lut, best_score, _, _ = TR.mining_walk(
-            parent["lut"], submission["pubkey"], submission["nonce"],
-            self.epoch, self.walk_steps,
-            deadline=time.time() + self.ant_budget * 3)
+        best_lut, best_score, _, _ = TR.mining_walk(
+            parent["lut"], submission["pubkey"], submission["nonce"],
+            self.epoch, self.walk_steps)
```

`walk_steps` already bounds the work and is part of the agreed epoch parameters, so verification stays bounded and becomes deterministic by construction.

The miner's deadline in `Miner_nxon.py:86` is deliberately left alone — that one is a local budget, and submissions carry no score precisely so that every node re-derives it.

## Evidence

Four nodes differing **only** in `ant_budget`, same submission, same epoch:

| ant_budget | verdict | score | child hash |
|---|---|---|---|
| 1e-09 | **REJECTED** | 16570 | `347304ad44c48b6b` |
| 0.001 | accepted | 30505 | `851a6b63af9b7b1d` |
| 1.0 | accepted | 87120 | `5e7cca3f9e28ac7d` |
| 60.0 | accepted | 87120 | `5e7cca3f9e28ac7d` |

Worth noting this is not only divergent scores: the slowest node **rejects a submission the others accept**, which is a chain split rather than a scoring discrepancy.

End to end, the shipped demo under a tight budget — same command before and after:

```bash
python3 NxonNode.py --nodes 3 --miners 5 --ticks 4 --walk-steps 400 --ant-budget 0.02
```

```
before:  Ticks with full agreement: 0/4
         System files byte-identical across nodes: False
           ['75044d4d39abac7a', '062f11e3aa38cad5', '7ee81d8fb8376b53']

after:   Ticks with full agreement: 4/4
         System files byte-identical across nodes: True  (43fb1723a1efcb4a)
```

Scores also come out **higher** with the fix (94,505 vs 84,650 on that command): removing the truncation lets the walk finish, so the colony climbs further. The deadline was costing search quality as well as determinism.

## Tests

Adds `NXAnt/tests/test_verify_determinism.py` (3 tests). Rather than timing-dependent sleeps, it monkeypatches `time.time()` to simulate a node that is arbitrarily slow, so the tests are deterministic themselves:

- `test_verify_ignores_a_slow_clock` — `verify()` must return the identical tuple when every clock read says the budget is already blown.
- `test_verify_agrees_across_budgets` — `ant_budget` is a local knob and must not reach the consensus value.
- `test_mining_walk_runs_every_step_without_a_deadline` — asserts `walk_steps`, not the clock, is what bounds the verifier.

```
before (unpatched main):  2 failed, 1 passed
after:                    3 passed
```

## Why the default run does not catch it

The shipped demo runs all nodes in one process, on one machine, sequentially, with `ant_budget=1.0` (a 3-second deadline) against walks that finish in milliseconds. The deadline never fires, so the bug is invisible. It becomes reachable whenever a walk can miss `ant_budget * 3`:

- **heterogeneous hardware** — the normal case for a public network;
- **node under load** — GC pause, scheduler pressure, noisy neighbour;
- **larger search parameters** — higher `--walk-steps`, bigger `--neurons`, longer `--sim-ticks`;
- **any future tightening of `ant_budget`** for throughput.

If a tighter bound is ever needed for DoS resistance, a **deterministic counter** would work where a clock does not — e.g. a `max_sims` cap derived from epoch parameters, so every node truncates at the identical step. I'm happy to add that instead if you'd prefer it over simply dropping the deadline.

The invariant worth stating explicitly either way: **no consensus-relevant function may read wall-clock time.**

## Follow-up (not in this PR)

With the deadline gone, the per-submission `verify()` calls in `process_tick()` are mutually independent — the function's own docstring notes all submissions are judged against the same pre-tick snapshot, with commits deferred to a second pass — and `mining_walk` is pure. `NXAnt` currently has no `multiprocessing`/`concurrent.futures`/`threading` usage, so the verify loop leaves most of a multi-core machine idle. Happy to open that as a separate PR. It is worth doing **after** this one and not before: parallelising while a wall-clock deadline is still in the path would make divergence *more* likely, since concurrent walks take longer in wall-clock terms.

---

Environment: Python 3.14.4, Ubuntu 26.04 (WSL2), AMD Ryzen 9 5900HX. No other modifications to upstream.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0dd4dbd82c42`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.