# Issue

**Title:** FIX: Reject averaged complex Welch coefficients

## Description

#### Reference issue

.

#### What does this implement/fix?

Welch `output="complex"` with `average="mean"` or `"median"` averages the Fourier coefficients across segments. Their phases do not line up, so the power formed from the average is not the average of the power. `normalization` is not involved: the one-sided factor of 2 already makes unaveraged coefficients match `output="power"` after squaring and then averaging. `average=None` and `average=False` still return one coefficient per segment. `output="power"` is unchanged.

#### Additional information

AI assistance: Grok 4.7 in Cursor drafted the guard, the regression test, and this description, after I asked it to fix this issue the same way as #14493.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b4f1de0ac024`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.