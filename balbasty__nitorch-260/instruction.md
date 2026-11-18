# Issue

**Title:** optim: L-BFGS commits the side effects at the accepted point

## Description

## Summary
With a Wolfe line search, `LBFGS.step` called `closure(param)` **before** applying the step:

```python
step, loss, grad = self.wolfe(0, closure1, delta=delta, loss=loss, grad=grad)
closure(param)  # to plot stuff / update loss state   <- still the previous iterate
delta.mul_(step)
...
param = self.update(delta, param)                      # step applied here
```

Line-search trials do not keep their side effects, and this normal evaluation is what commits them. So all of the following belonged to the **previous** iterate:
- the cached transforms, which `pairwise_postproc` uses to write the outputs (`exp(recompute=False)`);
- the state of stateful losses (MAD, Tukey, GMM, …);
- the printed and recorded objective.

Fix:
- apply the step first, then call `closure(param)`;
- apply it with the same operation as the trials, `param.add_(delta, alpha=step)`, so that the parameters are bitwise those of the accepted trial. `delta` is still scaled afterwards for the L-BFGS history.

The path without a line search is unchanged.

Found while working on #259. It is independent of #259: different files, and no merge conflict either way.

## Tests
- `nitorch/tests/test_lbfgs_commit.py` (new): after an L-BFGS fit (affine and SVF, with MSE and MAD), the cached transform equals the one recomputed from the final parameters.
  - The SVF cases fail on master and pass here.
  - The affine cases pass on both, because `do_affine_only` never caches its transform: `exp(recompute=False)` recomputes. They are kept as a regression guard. The lagging loss state and printed row are fixed for affine too, but this test does not observe them.
- Registration tests (`test_register_*`, line search, topup, field optim, `simplereg`): 1226 + 27 passed.

Part of #155.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_014dBjaUGFKHtAQeNPPDHTHh

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b4f97dc06039`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.