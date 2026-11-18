# Issue

**Title:** fix(journey): fold a return-named acceptance into its overlay entry

## Description

**Branch:** `fix/journey-overlay-return-alias` → `main`
**Base:** `ab9dd2db`
**Closes:** #407

## What was wrong

`build_kernel_journey` adds acceptances "named only in the workflow return"
after it has written one entry per overlay. It tests that "only" with the
emitted `kernel_id`. The two substreams do not name a kernel the same way: an
overlay directory carries the **candidate tag** (`cand_c0_triton`) and the
return carries the **kernel symbol** (`dsa_sparse_attn_prefill_main_kernel`).
The ids never collide, so one acceptance is emitted twice — once measured, once
with `gpu_pct: null` and the same `e2e_gain_pct`, both marked `KEEP`.

Full evidence, worked example, and the affected session list are in the issue.

## What this changes

`integrate_result.json` is the file that ties the two spellings together: it
records `cand_tag` **and** `short_name`. The fix reads the overlay's claim from
there and dedupes pass 2 against it.

Two small helpers, no change to any emitted field:

* `_overlay_claim(ir)` — what an **integrated** overlay says it optimized, or
  `None`. An overlay whose `gate` is not `accepted`/`stack` claims nothing, so
  a rejected or cut-off overlay still leaves a return acceptance as new
  information.
* `_claim_for(name, gain, claims)` — the claim that already covers this
  return-named acceptance. Symbol first, on the same normalization
  `_match_profiler` uses. Integrated e2e delta as the fallback, for the runs
  where the overlay recorded no usable symbol: the return copies that number
  from the overlay's own A/B rather than recomputing it, so an exact hit is the
  same measurement. The delta only folds when exactly one **unconsumed**
  overlay claims it.

A claim is consumed at most once, so one overlay can never absorb two distinct
acceptances.

This is deliberately not a name-similarity heuristic and not a rounded-gain
match. Every join is a value GEAK itself wrote to `integrate_result.json`.

## Why it is safe on real decompositions

`/shared_nfs/hyperloom-claw/Qwen3-14B-FP8/20260816T050457Z/geak/e2e_cycle0` has
one overlay (`cand_c0_aiter`, delta 7.53) and two accepted records — a
down_proj-shaped and a gate_up-shaped GEMM, deltas 6.779 and 0.705. Those are a
decomposition, not an alias. The consume-once rule keeps both entries. Verified
in the replay below and pinned by
`test_one_overlay_is_consumed_by_at_most_one_return_acceptance`.

## Verification 1 — replay over the live campaign

Rebuilt the journey for every `workflow_return.json` under
`/shared_nfs/hyperloom-claw/*/*/geak/e2e_cycle*/`, on `ab9dd2db` and on this
branch, and diffed the emitted entries.

| | before | after |
|---|---|---|
| e2e cycles replayed | 77 | 77 |
| `kernels[]` entries | 97 | **87** |
| entries removed | — | **10** |
| entries added | — | **0** |
| entries altered | — | **0** |
| `KEEP` entries | 36 | 26 |

Every removed entry carried `gpu_pct: null` and an `e2e_gain_pct` identical to a
surviving measured entry. Nothing measured was dropped. Ten sessions changed;
they are listed in the issue.

Downstream, Hyperloom's collector credited 8 of these duplicates as real
kernels, so the number on the TOP Model CI dashboard was over-counting GEAK's
kernels by 35 %.

## Verification 2 — tests

Eight new tests in the existing `interface/test_run_e2e_dispatch.py` journey
suite. Each pins one rule, and each is modelled on a real session:

| test | pins |
|---|---|
| `test_return_acceptance_already_on_disk_as_an_overlay_is_not_re_emitted` | the defect itself; the measured entry survives |
| `test_sibling_candidates_for_one_symbol_each_stay_their_own_entry` | folding is against the return, never between overlays |
| `test_symbol_less_overlay_folds_the_return_on_its_integrated_delta` | the delta fallback (Kimi-K3 case) |
| `test_an_ambiguous_delta_never_folds_two_kernels` | two overlays sharing a delta fold nothing |
| `test_one_overlay_is_consumed_by_at_most_one_return_acceptance` | the decomposition case above |
| `test_a_rejected_overlay_claims_nothing` | do-no-harm; a REVERT is not an acceptance |
| `test_an_incomplete_ab_overlay_claims_nothing` | no `integrate_result` at all |
| `test_folded_return_acceptance_is_absent_from_synthetic_discovery` | a folded entry does not return as a synthesized hot_kernel |

Full `interface/` suite, same interpreter, same machine:

```
base ab9dd2db : 168 passed, 1 skipped, 0 failed
this branch   : 176 passed, 1 skipped, 0 failed
```

## Reproduce the replay

```bash
python - <<'PY'
import json, glob, importlib.util
from pathlib import Path
spec = importlib.util.spec_from_file_location("rx", "interface/run_e2e.py")
rx = importlib.util.module_from_spec(spec); spec.loader.exec_module(rx)
n = 0
for wfp in sorted(glob.glob('/shared_nfs/hyperloom-claw/*/*/geak/e2e_cycle*/workflow_return.json')):
    d = str(Path(wfp).parent)
    j = rx.build_kernel_journey(json.load(open(wfp)), {"eval_dir": d})
    n += len(j["kernels"])
print("journey entries:", n)   # 97 on ab9dd2db, 87 on this branch
PY
```

## Not addressed here

* Pass 1 still names an entry after the candidate tag even when
  `integrate_result.short_name` holds the real profiler symbol. Changing the
  emitted `kernel_id` would move the fold key the orchestrator's assembler uses,
  so it belongs in its own change.
* Hyperloom's defensive collapse (AMD-AGI/Hyperloom `8d108b0`) stays. It has to:
  the 77 journeys already written to disk still contain the duplicates, and the
  dashboard reads those files. Once this ships, that collapse is a no-op on new
  runs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `129d7f7fafda`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.