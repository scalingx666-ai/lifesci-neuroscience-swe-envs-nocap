# Issue

**Title:** fix(e2e): Reach Finalize/Report before the wall-clock budget runs out (Hyperloom #1202)

## Description

## Reach Finalize/Report before the wall-clock budget runs out (Hyperloom #1202)

### Problem

Three Hyperloom sessions finished their optimization work but shipped **no final report** — no
`final_report.md`, no `architect_report.md`. The orchestrator was handed a bare `recovered_no_gain`
stub instead of the run's actual results. Root-causing against `GEAK@main` found three defects, all
inside GEAK:

1. **GEAK paced against the wrong budget.** Hyperloom launches
   `run_e2e.py <handoff> <result> --timeout-s <kill_time>`, but `main()` read the budget only from
   `GEAK_E2E_TIMEOUT_S` (default `43200` = 12h). Because the positional filter was
   `args = [a for a in argv if not a.startswith("--")]`, the real `--timeout-s` **value** landed in an
   ignored third positional and was discarded. A caller killing at 8h while GEAK paced for 12h → hard
   teardown mid-optimization, before Finalize ever started.

2. **No wall-clock was reserved for the final phase, and deep mode never carved a tail.** Fast/default
   modes stop dispatching at `max(60%, budget − 3h)`, but deep set `DEEP_HEAD_BUDGET_MS = effective`
   (~92% of budget) and its wave loop tested only `DEEP_DEADLINE_HIT`, never the shared
   `TIME_DEADLINE_HIT`. After the last wave it still had to drain a 75min burst, run a final e2e gate,
   then Finalize → Report → Validate → persist — it could not fit.

3. **An in-flight optimization step could overrun whatever tail remained.** The loop-tops stop
   *starting* new work at the deadline, but a single head/kernel iteration is a *sequence* of agents
   (extract → bake-off → author → verify), each armed with the full `AGENT_TIMEOUT_MS` (2h). One long
   step legally started just before the deadline ran straight into the SIGKILL (the observed stall was a
   ~62min `extract_op` that consumed the entire tail), starving Finalize/Report/Validate.

### Fix

Everything below is gated on `time_budget_s` being present. Without it, `remainingMs()` is `Infinity`,
every guard short-circuits, and the run is **byte-identical** to a direct (non-interface) invocation —
verified by the identical-path test.

**`interface/run_e2e.py`**
- New `_resolve_timeout_s(argv)`: parses `--timeout-s N` / `--timeout-s=N`, keeps positionals intact,
  and resolves the budget as `min()` of every *stated* source (the CLI flag and `GEAK_E2E_TIMEOUT_S`),
  falling back to 12h only when neither is given. `min()` because the smaller number is a real kill, so
  pacing to it is never wrong. The resolved value is logged (`[budget] wall-clock …`) and forwarded as
  `time_budget_s` (already wired through `map_args`).
- New `GEAK_FINAL_RESERVE_S` → `final_reserve_s` passthrough so an operator can widen the reserve per
  run without editing the JS.

**`e2e_workflow/e2e_workflow.js`**
- **Elapsed clock.** `Date.now()`/`new Date()` are unavailable in Workflow scripts (they break resume),
  so elapsed time is *counted* via a self-rearming 1-minute `setTimeout` tick → `remainingMs()`.
- **One reserve, one effective budget.** `FINAL_RESERVE_MS = min(50min, 20% of budget)` is the hard
  floor held back for the *whole* final phase; `TIME_BUDGET_EFFECTIVE_MS = budget − reserve` is the
  single definition of "time available to optimize", and `TIME_HEAD_DEADLINE_MS` is hoisted so every
  mode shares it.
- **Deep obeys the same carve** (the core deep fix): `DEEP_HEAD_BUDGET_MS = TIME_HEAD_DEADLINE_MS`, and
  the wave loop is now `while (!DEEP_DEADLINE_HIT && !TIME_DEADLINE_HIT)`.
- **Option A — cap in-flight optimization agents.** Near the deadline each *optimization* agent's
  hung-guard is tightened to `max(2min, remainingMs − FINAL_RESERVE_MS)`, so no in-flight step can
  finish later than `budget − reserve`. Final-phase agents (`Finalize`/`Report`/`Validate`) are
  **exempt** — they run *inside* the reserve by design. The 2min floor lets a deadline-killed agent's
  retries self-limit instead of burning the reserve.

**Why the reserve is 50min, and why the reports survive even if it's exceeded.** Sized off 85 historical
Hyperloom runs whose final phases took p50 40min / p75 50min / p90 77min / max 86min: 50min covers ~p75.
Crucially, **Report writes both reports *before* Validate**, so a run whose tail exceeds the reserve still
ships `final_report.md` + `architect_report.md`; only the independent Validate re-measure is at risk, and
`run_e2e.py` already falls back (`director_e2e_validation.json` → best overlay's `integrate_result.json`),
so a real parity-checked win still reaches the caller.

Also fixes the stale `ci/node/run_geak_e2e.sh` comments that documented the old "flag is discarded"
behavior.

### Evidence

**Byte-identical no-budget path.** `node e2e_workflow/scripts/test_expert_skills_off_identical.js` →
`PASS`; `node --check` clean. The whole feature is inert when `time_budget_s` is absent.

**Isolated final-phase replay (synthetic no-gain state, 40min budget).** Drove `phases:"final"` on a
reconstructed pre-Report state. All four deliverables landed in ~20min as **genuine validated results**:
`workflow_return.json` → `validation_status: "validated_no_win"`, `output_parity: "pass"`, **not**
`recovered_from_disk`; `run_e2e` exited clean (`{"status":"no_gain","speedup":0.9981}`).

**Real #1202 replay.** Took an actual failed run from the fleet
(`Qwen3-0.6B/20260806…/e2e_cycle0` — a ~7h run killed before Report that originally produced *only* a
`recovered_no_gain` stub and no reports), restored its true pre-Report state, and replayed the final
phase with the fixed GEAK:

| deliverable | original failed run | fixed GEAK replay |
|---|---|---|
| `final_report.md` | ❌ absent | ✅ 32 KB, workflow-authored |
| `architect_report.md` | ❌ absent | ✅ 3.4 KB, official result |
| `final/` bundle (overlay, patch, launch, `final_result.json`) | ❌ absent | ✅ present — re-benched the pending candidate overlay and correctly **rejected** it (parity regression 2/12 prompts + sub-noise) → true no-gain |

The reports are workflow-authored (confirmed: `run_e2e.py` never writes `final_report.md` content). This
is the core #1202 outcome — the run now ships its report where before it shipped nothing. (A companion
run with a realistic reserve is confirming the full Finalize→Report→Validate path end-to-end, including
`director_e2e_validation.json` and a non-recovered `workflow_return.json`.)

### Tests

- `python3 -m unittest interface.test_run_e2e_dispatch` → **161 passed**, incl. three new cases:
  `test_timeout_budget_is_read_from_the_cli`, `test_smallest_stated_budget_wins`,
  `test_final_reserve_is_overridable_from_the_environment`.
- `node --check e2e_workflow/e2e_workflow.js` → clean.
- `node e2e_workflow/scripts/test_expert_skills_off_identical.js` → `PASS` (no-budget path unchanged).

### Compatibility / risk

- No-budget (direct) invocation is byte-identical — the entire mechanism is gated on `time_budget_s`.
- Result schema unchanged; `run_e2e.py` still passes the `validation_status` string through and only
  hard-matches `"validated_win"`, so a skipped/short Validate never demotes a real win.
- Narrows deep mode's optimization window (12h budget: ~11h → ~9h) — intentional, matching what
  fast/default already do.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `befec59c84ec`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.