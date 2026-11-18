# Issue

**Title:** [ENH] - Add `average_reconstructions` function

## Description

Adds a new `average_reconstructions` function as a minor helper function - an addition mentioned in #227 

Note: the last commit is unrelated to the new function - it's just a small update to the aliasing of `plot_spectrum` to `plot_spectra` - moving this alias to the file means that `from fooof.plts.spectra import plot_spectrum` should work now whereas is would fail otherwise.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f8ed771263fe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.