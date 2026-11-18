# Issue

**Title:** fix(validate): Let a trace replay's single-kernel wins reach Validate

## Description

## Summary

On an AgentX trace replay, every integrate A/B runs on the search window (`geak_loop_duration_s`,
900 s by default). Validate then re-measures the whole bundle against stock on the canonical window
(`duration_s`, 3600 s). Two checks on the A/Bs stop wins before they get that far.

- **A comparison across windows.** `curTput` starts at Setup's number, measured on the canonical
  window. Each banking site requires the integrator's same-window gate and also
  `e2e_throughput_tok_s > curTput`. Until something is banked, that compares a search-window number
  with a canonical-window one. The two windows replay different slices of the trace, so the
  comparison says nothing about the candidate. When the search window reads lower, it drops a win
  the A/B measured. Nothing is adopted, and Validate is skipped as `final_is_baseline`.
- **A 4% band on every A/B.** A trace replay's acceptance noise band defaults to 4%, about the
  spread two replicas of the same config showed. One kernel rarely moves e2e that far: at 1.5x
  isolated, a kernel needs more than 11.5% of the GPU time to clear 4%. Most single-kernel wins
  therefore come back as sub-threshold `stack` results rather than `accepted`.

## Change

- `beatsCurTput(integ, curTput)` replaces `integ.e2e_throughput_tok_s > curTput` at all six banking
  sites: corrective re-author, the deep scheduler, HeadKernel's head-winner and per-candidate
  integrations, Milestone, and the Finalize-gate. On a trace replay, an `accepted` gate is enough:
  `delta% > NOISE_BAND_PCT` and `cand_min > ref_max`, both on the search window. A sub-threshold
  `stack` result still has to beat `curTput`. Fixed-ISL/OSL runs compare as before.
- A trace replay's noise band defaults to 0.5%, as a fixed-shape run's does. The Director's band
  can still widen it, and an explicit `noise_band_pct` is still a floor that only the Director can
  widen, so `noise_band_pct=4` restores the old band.

A win kept this way goes through what a trace-replay win already gets. Finalize benches one search
leg. The Director is told the claim is a search-window number and arbitrates on its own canonical
A/B. `run_e2e.py` then holds that pair to the KEEP rule: the caller's if it states one, else GEAK's
default for a trace replay (+3% on the graded axis, guards within 5%). A run that banked nothing
still skips Validate as `final_is_baseline`, and one short of time still skips it as `no_time`.

## How it showed up

An AgentX trace-replay run (c16) on sglang, under Hyperloom, whose KEEP rule was +2% on P50
interactivity with P90 interactivity within 5%:

- Setup measured the stock config at 85.608 on the 3600 s window. The band came out at 4%: the
  Director reported 0.5%, and the trace-replay floor raised it.
- The HeadKernel candidate for `hc_mix_gated_residual` (hipBLASLt, 1.53x isolated) got its
  integrate A/B on the 900 s window: reference 70.257, candidate 75.962, +8.119%, gate
  `accepted`, output parity pass.
- Nothing had been banked yet, so `curTput` was still 85.608. The candidate's 75.962 is below it,
  and it was logged as rejected. To pass, it would have needed more than +21.8% over its own
  reference, which was the same stock config.
- Nothing was adopted, Validate was skipped as `final_is_baseline`, and the run ended with no gain.
  Validate would have had time: GEAK returned with about 4¾ hours of its budget unused.

## Behavior changes

- On a trace replay, an accepted same-window win is banked even when its search-window number is
  below `curTput`, and Validate runs its two canonical-window legs instead of being skipped. On that
  run this would have added about 2½ hours (two legs of about 65 minutes, plus the Director's
  checks), all inside the final reserve.
- Every A/B and Validate's verdict gate on 0.5% instead of 4%. Two replicas of the same config
  differed by 3.4–3.9%, so more A/Bs come back `accepted`, some of them on noise, and each one kept
  sends the run to Validate. Through `run_e2e.py` the final bar is the KEEP rule. A direct
  `Workflow` call has no KEEP rule, so its Validate gain bar drops to 0.5% unless `noise_band_pct`
  is passed; its guards stay at 5%.
- The KB warm start accepts a recalled config on the same band, at +0.5% over Setup's number
  instead of +4%. Its trial runs on the search window, so that comparison is across windows too.
  This PR leaves it as it is; a config it adopts still goes to Validate.
- After the first win, `curTput` holds a search-window number. This already happened whenever a
  trace replay banked anything, and the Finalize note, the Validate claim note and `run_e2e.py`'s
  fallback all account for it.

Unchanged: fixed-ISL/OSL runs; how a sub-threshold `stack` result is banked; `integAccepted`
(parity, speedup review, A/B completeness); the Validate skip rules; the time budget; and an
explicit `noise_band_pct`. Disk recovery in `run_e2e.py` already applies `integAccepted` and parity
without the absolute check, so it needs no change.

## Tests

- `e2e_workflow/scripts/test_time_budget_reserve.js`: a new block next to the Validate-skip checks,
  run against the shipped helpers. It checks:
  - With that run's A/B (gate `accepted`, candidate 75.962 against `curTput` 85.608), a trace
    replay keeps the win.
  - A `stack` result still has to beat `curTput`.
  - A fixed-ISL/OSL run keeps the absolute check, ties included.
  - A kept win reaches Validate, and a run that kept nothing still skips as `final_is_baseline`.
  - All six banking sites apply the rule after `integAccepted`, and nothing else compares
    `e2e_throughput_tok_s` with `curTput`.

  On main the block fails: the rule does not exist, and the six sites compare with `curTput`
  directly.
- `e2e_workflow/scripts/test_noise_band_scope.js` now checks that a trace replay defaults to 0.5%,
  that the Director can still widen it, that an explicit band survives Setup (`noise_band_pct=4`
  included), and that Setup and a resumed phase both resolve the band the same way. On main its
  trace-replay checks fail.
- `test_agentx_baseline_selection.js` runs the Milestone integration block with its collaborators
  stubbed, and now stubs `beatsCurTput` next to `integAccepted`. Its assertions are unchanged.
- CI's lists, run locally: the pytest list passes (coverage 97.17% against the 97% gate), all 22
  Node commands pass, and so do the contract checks, the shell syntax check, the vendored-skillset
  check and the dry-run.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0ea9b835db08`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.