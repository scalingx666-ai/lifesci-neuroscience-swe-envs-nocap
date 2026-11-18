# Issue

**Title:** Fix stats permutation bugs

## Description

Okay this one was a pain.

1. Fix the off-by-one from #14479
2. Fix a sign convention mismatch (0 and 1 meaning don't flip and flip when the consuming function used them in the opposite way)
3. Fix a small bug involving use of `abs` when we actually needed to pick either the min or max depending on `tail`

Has co-author trailer since this was WIP in #12216 (thanks @kimcoco !)

Diagnosed and code changes drafted with Claude Opus 5.5, I reviewed the code in depth. I also had it run equivalence tests with FieldTrip (installed locally as well) as extra insurance that we're hopefully doing things correctly now. :sweat_smile:

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7986de7d5b5d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.