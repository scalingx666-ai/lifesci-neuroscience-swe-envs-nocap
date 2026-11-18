# Issue

**Title:** fix(review pending) Ignore an integrator's own `pending` speedup review

## Description

## Summary

The integrate schema lets the integrator return `speedup_review.status: "pending"`, but the
workflow never writes that status. The workflow alone decides whether a gain needs an
independent confirmation (`speedupNeedsReview`: a soft-parity accept whose measured gain is more
than twice the Amdahl estimate), and records the outcome as `confirmed`, `inconclusive` or
`rejected`.

A result the integrator flagged `pending` on its own was honoured anyway, on both sides of the
estimate:

| Workflow's estimate | Before | After |
|---|---|---|
| Gain within it (no review needed) | `integAccepted` refuses the win | banked as an ordinary accept |
| Gain beyond it (review needed) | `reviewSpeedup` returns before requesting the confirmation A/B, so nothing ever clears the flag | the confirmation A/B runs, as for any surprising gain |

Either way the candidate never reached the overlay, the final bundle was the stock config, and
Validate skipped its timed legs as `final_is_baseline`.

## Change

- `reviewSpeedup` drops an integrator-written `pending` on entry, before any early return. The
  estimate then decides between banking the win and running the confirmation, exactly as for an
  unflagged result. Only the workflow's own outcomes (`inconclusive`, `rejected`) still
  short-circuit a review. Every banking site goes through `runIntegrateBothLegs`, and so through
  `reviewSpeedup`.
- Disk recovery (`_integrate_candidates` in `interface/run_e2e.py`) ignores the flag the same way,
  so recovery still banks exactly what the live workflow would.

## How it showed up

A standalone AgentX run (TP1, c16) measured a fused gated-residual candidate at +12.79% on P90
interactivity, with the overlay engaged and the accuracy gate clean (gsm8k 0.955 vs 0.955). Using
the integrator's whole-module coverage (19.1% of GPU time), the workflow's estimate was +7.07%, so
it reviews only above +14.14%: no review was needed. The integrator compared the gain against its
own head-only ceiling (+4.96%) instead, and returned `speedup_review: {status: "pending"}`.
`integAccepted` refused the win, nothing ever cleared the flag, and the run ended `no_gain` with
Validate skipped.

Replaying that run's `integrate_result.json` through the shipped helpers: `speedupNeedsReview` is
false; `integAccepted` is false as returned, and true without the integrator's `speedup_review`.

## Behavior changes

- A gain the integrator flagged but the workflow's estimate allows is now banked.
- A flagged gain beyond the estimate now gets its confirmation A/B (two fresh legs, two replicas
  each). That review is still gated by `searchClosed` and the final-reserve check, so it cannot
  run into the final phase.

Unchanged: results without `speedup_review`; the workflow's own review outcomes, including resumed
`inconclusive` and `rejected` reviews; confirmed reviews; the review threshold; and the integrate
schema, which still accepts `pending`, so existing integrator output keeps validating. Fixed
ISL/OSL and AgentX runs share this path.

## Tests

- `e2e_workflow/scripts/test_speedup_review.js`: two new cases. A flagged gain within the coverage
  estimate is banked with a single agent call and an `accepted_intermediate` checkpoint. A flagged
  surprising gain gets the `FORCE_FRESH_AB` confirmation and is banked once confirmed. Both fail on
  main.
- `interface/test_run_e2e_recovery.py`: the same two cases for disk recovery. The first fails on
  main; the second pins the unchanged behavior that an unconfirmed surprising gain stays pending.
- CI's lists, run locally: the pytest list passes (coverage 97.17% against the 97% gate) apart from
  two unrelated tests that fail the same way on main outside CI, and all 20 Node commands pass.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ec97e49ca886`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.