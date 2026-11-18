# Issue

**Title:** FIX(register): Powell line-search tolerance, nonlin error, verbose convention

## Description

## Summary
Part of #114. These are the Powell follow-ups from #108. Only `optim/powell.py` changes; the CLI and parser are untouched, so this does not conflict with #110. The branch is merged with the latest master, which includes #112 and #115.

- **Line-search tolerance:** Brent's tolerance was hard-coded at `1e-9`. It now defaults to `sqrt(tol)`, where `tol` is the outer iterator's tolerance (`-t/--tolerance`). Near a minimum the loss changes quadratically with the step, so a step precision of `sqrt(tol)` gives a loss precision of about `tol`. A new `line_tol=` option overrides it. On a 24³ rigid pair (MSE, one level, TS backend) the run went from 5.5 s to 1.8 s. The transform is still recovered within the same tolerances.
- **Nonlinear fields:** Powell now raises a `ValueError` when its parameter is a dense field (a tensor with more than one dimension). The message says Powell is only supported for affine and suggests `gn` or `lbfgs` for `@nonlin`. Before, it built `eye(len(x))` over the field's first dimension.
- **Verbose output:** Powell follows the same convention as the other optimisers (`pairwise_impl.py` `print`):
  - At verbosity 1–2, iterations rewrite the same line, which is the intended behaviour. The first commit had added a newline here; the second commit removes it.
  - Evaluations inside the Brent searches go through `in_line_search=True`.
  - At verbosity 3 and above, each iteration gets its own line.

  I found no real bug at `-v >= 3`, so the code change is a comment only.

## Tests
New file `nitorch/tests/test_register_powell.py`:
- a looser tolerance uses fewer closure evaluations and still converges
- an explicit `line_tol` takes priority over the derived one
- a dense field raises the error, both directly and through `register @nonlin svf @@optim powell`
- the verbose convention, tested by running Powell on a closure that uses `PairwiseRegisterStep.print`. This covers `-v 1/2` (lines rewritten, no `\n`) and `-v 3` (one line per iteration, searches overwritten). Doing it this way avoids the matplotlib dependency of `-v 3`.
- `register -v 1` keeps all iterations on one rewritten line
- `affreg` with its defaults still recovers a known rigid transform

`pytest nitorch/tests/test_register_powell.py nitorch/tests/test_register_optim.py`: 16 passed.

## Found, not fixed here
- `-v 3` through the CLI needs `matplotlib`, which is not a declared dependency.
- The first Powell iteration shows zero gain with the current CLI `lr=1`. This may change once #110 sets lr to 0.02.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01MHwEa9dAf8MwawzzozKLzE

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `10e9be9ba462`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.