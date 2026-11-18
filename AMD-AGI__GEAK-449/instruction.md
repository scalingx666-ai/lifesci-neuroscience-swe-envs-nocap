# Issue

**Title:** fix(kernel_workflow): make the TIMING RECEIPT GATE satisfiable

## Description

## The problem

The TIMING RECEIPT GATE in `kernel_workflow/roles/director.md` cannot be satisfied on **any** route, so every run is judged `flagged`. Two independent defects.

**1. The receipt's producer and consumer are on different code paths.** `oracle_freezer` is the only producer of `GEAK_TIMING_RECEIPT`, and it runs only in the bake-off dispatcher's Freeze phase. But `kernel_workflow.js` returns early on `mode=optimize` (the default) and never reaches Freeze — while `kernel_lane.js` calls `director` unconditionally and the gate fires in all three modes. `kernel_lane.js` referenced `oracle_freezer` / `harness_lib` / `Freeze` exactly **0** times.

`timing_basis` itself has no code consumers; the load-bearing part is the `status: "flagged"` it drags along:

| Site | Gate | Consequence |
|---|---|---|
| `kernel_workflow.js:436` | `speedup>1.0 && (kind!=='lane' \|\| ACCEPTED(c))` | **bake-off could never pick a lane winner.** Only an env candidate could win; otherwise `winner=null` and the original kernel was kept. Multi-language bake-off was inoperative. |
| `kernel_lane.js:1604` | `kbAccepted && finalPrimary>1.0` | no `knowledge/learned/` card was ever written. |

**2. Even on the bake-off route, the harness couldn't produce `primed`.** `host_ms` and `primed` appeared **0** times in `harness_lib.py`. The gate's introducing commit (`26ddf480`) says it depends on branch `fix/harness-dispatch-bubble`, which matches 0 remote branches and was never merged.

## The fix

**Defect 1 — give the gate a deterministic answer to "does this lane have a frozen oracle?"** The discriminator has to be code-supplied, not a prompt: the gate's flaky-looking output (19 `unknown` + 1 `not_measured` across campaign20) came precisely from asking an agent to work it out at runtime. Workflow scripts have no filesystem access, so the side that *knows it froze something* passes it down.

`kernel_workflow.js` sets `frozen_oracle:'true'` in the bake-off lane args — already explicitly enumerated, unlike the optimize path's `{...A}` spread, so it reaches bake-off lanes and nothing else. `kernel_lane.js` threads it to director. `director.md` gains a pre-branch: `FROZEN_ORACLE` not `true` → this lane never went through Freeze, the receipt does not exist *by construction* → `timing_basis: "not_applicable"`, and its absence is **not** grounds to flag.

The point is splitting "receipt missing" into **not applicable** (no Freeze, normal) vs **should be here and isn't** (frozen but the unittest is stale — a real fault). Today both collapse into `unknown`.

**Defect 2 — actually emit the receipt.** `time_op` probes host dispatch cost separately, on a drained queue so there's no backpressure, and emits both keys together: `primed = host_ms < dev_ms`. Three-state semantics preserved — `True` / `False` / **absent** — and absent must not collapse into `False`.

## What this PR deliberately does *not* do

It does not touch the timing loops. An earlier revision batched the event windows to remove a suspected dispatch bubble. **That was rejected on measurement.** Fitting per-launch `ms` against `1/inner` on MI355X (torch 2.9.1 / ROCm 7.2) separates kernel time `K` from per-window overhead `E`:

| op | K new / legacy (µs) | E new / legacy (µs) | ΔE |
|---|---|---|---|
| gemm4096 | 96.73 / 97.80 | 18.48 / 7.70 | **+10.79** |
| gemm512 | 11.54 / 11.28 | 3.75 / 3.28 | **+0.47** |
| add8 | 4.84 / 5.13 | 4.53 / 1.36 | **+3.17** |
| gemm4096 *(flush)* | 95.97 / 98.56 | 23.01 / 9.44 | **+13.57** |
| gemm512 *(flush)* | **7.40 / 11.53** | 1.02 / 3.56 | −2.53 |
| add8 *(flush)* | **1.88 / 5.25** | 4.42 / 1.23 | **+3.20** |

Batching **raised** per-window overhead in 5 of 6 configurations. Worse, under `flush` it let the two timers disagree on `K` itself by up to 2.8× — flush and kernel become two commands in one packed queue, so the cold-HBM guarantee this harness exists to provide stops holding, and the single apparent "win" is just the batched path measuring a warmer kernel.

So the timing loops are **byte-identical to `main`**, which means **no number moves** (historical KB pages and campaign results stay comparable, no `framework_version` split) and **no `HARNESS_LEGACY_TIMER` switch is needed** (zero drift, nothing to be compatible with). The evidence lives in `_time_events`' docstring so it isn't silently reintroduced.

## Verification

On MI355X (gfx950), both arms, against a purpose-built Triton row-softmax (three passes over HBM, fixed `BLOCK=128` — deliberately easy to beat, so the assertions are crisp; correctness 5.6e-9).

**optimize** — `validation_status: "accepted"`, `timing_basis: "not_applicable"`, 4.011×, learned card written (previously 0, ever).

**bake-off** — `winner: {lang:"hip", kind:"lane", speedup:4.553, accepted}`; triton lane 3.506× also accepted. **A lane won**, structurally impossible before. `NOT eligible to win` never fired. Receipt carried `{"all_primed":true,"timer_unprimed":false,...,"host_ms":0.042}` — 0 occurrences globally before this change, and `all_primed:true` is a measurement, not a default: host dispatch really is cheaper than the kernel's device time, so a candidate that "wins" by collapsing dispatch still lands on `primed:false`. Frozen task dir's `harness_lib.py` matched the repo sha256 byte for byte.

Both halves of the split got exercised: optimize took `not_applicable`, bake-off took the real receipt.

**Tests:** 261 harness + 34 leg_runner pass; `py_compile` / `node --check` clean.

## Blast radius on e2e

e2e is **not** affected by defect 1's damage: its own `director.md` has no such gate (0 keyword hits) and `e2e_workflow.js` records `validation_status` but never gates on it — the integration gate is real server throughput.

e2e **does** share `harness_lib.py`, with two consequences:
- **Numbers unchanged.** `leg_runner.py:124` explicitly picks `ms` / `wall_ms` / `timer` out of the detail dict, so the two new keys are dropped, not propagated. And the timing loops didn't change.
- **Small added cost.** `_host_dispatch_ms` issues `_HOST_PROBE_LAUNCHES + 3` extra launches per `time_op` call, after the measurement window. It does not perturb the returned value.

e2e calls `kernel_lane.js` directly, so its lanes now get `timing_basis: "not_applicable"` instead of a spurious `flagged` — same fix as the optimize arm, and it unblocks the learned-card write on that path too.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fa86fd1e9bec`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.