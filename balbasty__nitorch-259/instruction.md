# Issue

**Title:** optim: only return derivatives evaluated at the returned parameters (fresh Gauss-Newton Hessian)

## Description

## Summary
With the strong Wolfe line search, the default here, every Gauss-Newton step used **the Hessian of the first iteration**.

- `StrongWolfeLineSearch.step` returned `(param, loss, grad, *derivatives)`:
  - `loss` and `grad` came from the accepted trial, at the new point;
  - `*derivatives`, the Hessian, was what the step received at the start, at the old point.
- `OptimIterator` passed all of this to the next step, and `_get_loss` only re-evaluates when a derivative is missing. So the closure was never called with `hess=True` again.
- In the joint fit, `InterleavedOptimIterator` also passed each block the loss and derivatives of its previous turn, evaluated before the other block moved. The resumed block's line search therefore started from a stale `f0` and `g0`.

The no-line-search and backtracking paths already re-evaluate everything after each step, so only the Wolfe path behaved this way. The behaviour dates from 92d1d5eb (2022).

Rule applied here: **a step only returns derivatives evaluated at the parameters it returns.**
- `StrongWolfeLineSearch` drops the Hessian it did not evaluate. The next step evaluates loss, gradient and Hessian at the accepted point.
  - That is a normal evaluation, so it also commits the side effects that line-search trials do not keep: cached transforms, loss states, and the printed/recorded objective.
  - The loss-only re-evaluation after each line search is therefore only kept for first-order optimisers, which reuse the trial's gradient (still valid at the accepted point).
- `OptimIterator.commit_line_search`: after the last step, if that step left derivatives missing, one loss-only normal evaluation commits the side effects. This is once per block run instead of once per iteration.
- `InterleavedOptimIterator` passes only the parameters between turns.
- The step is applied with `param.add_(delta, alpha=a)`, as in the trials, so the parameters are bitwise those of the evaluated trial.

This supersedes #253, which removed the per-iteration re-evaluation with a stash/commit mechanism and was closed as too complex for its gain. Here, the re-evaluation disappears as a side effect of the fix.

L-BFGS (`optim/lbfgs.py`) calls `StrongWolfe` directly and is not changed.

## Effect
`nitorch register` on the bench T1/T2 pair, master vs this PR.
- Objective: lower is better.
- Rows: printed iteration rows.
- Evaluations, counted by kind: `+H` = with Hessian; trials = line-search trials with gradient; loss-only = loss without derivatives.

**`@pyramid -l 3`**, same iteration budgets as before:

| config | branch | rows | +H | trials | loss-only | time | final objective |
|---|---|---|---|---|---|---|---|
| SVF LCC, `-n 8` | master | 9 | 1 | 29 | 8 | 30.3 s | −1.41806 |
| | **this PR** | 9 | 8 | **8** | 1 | **21.0 s** | **−2.11285** |
| joint rigid+SVF MSE | master | 27 | 3 | 94 | 24 | 31.3 s | −2.12026 |
| | **this PR** | 31 | 24 | **57** | 7 | 32.0 s | **−2.28665** |
| symmetric joint MSE | master | 30 | 3 | 74 | 27 | 36.5 s | −2.69750 |
| | **this PR** | 34 | 27 | **34** | 7 | 33.6 s | **−2.73693** |
| affine LCC, `-n 10` | master | 11 | 1 | 16 | 10 | 5.3 s | −0.959229 |
| | **this PR** | 11 | 10 | 25 | 1 | 5.4 s | **−1.00095** |
| small-def NMI, `-n 6` | master | 7 | 1 | 12 | 6 | 19.8 s | 0.794484 |
| | **this PR** | 7 | 6 | **6** | 1 | **15.5 s** | 0.795691 |
| rigid NMI, `-n 10` | master | 3 | 1 | 5 | 2 | 4.8 s | 0.848218 |
| | **this PR** | 3 | 2 | 5 | 1 | 5.2 s | 0.848222 |
| SVF MAD, `-n 6` | master | 3 | 1 | 1 | 2 | 7.8 s | −1.51408 |
| | **this PR** | 3 | 1 | 1 | 2 | 7.8 s | −1.51408 (identical) |

**Full resolution (192³, `@pyramid -l 0`):**

| config | branch | +H | trials | loss-only | time | final objective |
|---|---|---|---|---|---|---|
| rigid NMI, `-n 3` | master | 1 | 3 | 3 | 55.8 s | 0.931800 |
| | this PR | 3 | 3 | 1 | 55.0 s | 0.931797 |
| SVF MSE, `-n 2` | master | 1 | 2 | 2 | 348.1 s | −1.14633 |
| | this PR | 2 | 2 | 1 | 356.3 s | **−1.15105** |

Reading:
- **Fewer trials per step with nonlinear models.** With the Hessian at the current point, the full Gauss-Newton step is usually accepted at once: SVF LCC takes 1 trial per step (29 → 8), and joint and symmetric MSE need 40–55% fewer.
- **Lower objective in the same number of iterations** for SVF LCC (−1.418 → −2.113), joint MSE, symmetric MSE, affine LCC and full-resolution SVF MSE.
  - Small-def NMI ends marginally higher (0.79569 vs 0.79448), because master happened to take a large step at its last iteration. Rigid NMI agrees to 4e-6.
  - The joint runs now print a few more rows: each block turn ends with its own commit.
- **Time per run is similar or lower.** Each iteration now pays one Hessian evaluation instead of one loss-only re-evaluation, and saves trials. For fixed iteration counts it ranges from −31% (SVF LCC) to +4% (full-resolution SVF MSE, 2 iterations).
  - With the convergence tolerance active, the faster decrease should also mean fewer iterations; this was not measured here.
- **Stateful losses** (MAD, Tukey) now update their state once per iteration, at the Hessian evaluation, instead of twice (re-evaluation, then next step). This is the same as the no-line-search path.

## Tests
- `nitorch/tests/test_register_eval_count.py`:
  - the Hessian is recomputed at each step, and line-search trials never ask for it; affine and nonlinear;
  - exactly one loss-only commit, after the last step;
  - joint fit: each block turn starts with a normal loss+gradient+Hessian evaluation at the current parameters, and ends with one commit;
  - after `fit()`, the cached transforms equal those recomputed from the final parameters: affine, nonlinear and joint, with MSE and MAD;
  - first-order optimiser with Wolfe: the trial gradient is still reused, with one commit per step.
- The new Hessian and joint tests fail on master; the others pass on both.
- Full suite (TS backend, torch 2.15): 4174 passed, 111 skipped, 0 failed.

## Side finding (not changed here)
In `LBFGS.step` (Wolfe branch), the commit `closure(param)` runs **before** `param = self.update(delta, param)`. So the cached transforms, loss states and printed row are those of the previous iterate. I'd fix it in a separate PR.

Part of #155 and #154.

---
_Generated by [Claude Code](https://claude.ai/code/session_014dBjaUGFKHtAQeNPPDHTHh)_

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a9d0cd53b15d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.