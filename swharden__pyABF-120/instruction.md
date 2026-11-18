# Issue

**Title:** Added necessary imports to memtest.py to solve AtributeError

## Description

Adding these imports in `memtest.py` can solve AttributeError, which occurs when trying to use Memtest

`import pyabf.tools.sweep`
`import pyabf.tools.memtestMath`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8e3a826b9694`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.