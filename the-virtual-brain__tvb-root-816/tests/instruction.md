# Issue

**Title:** TVB-3184. Fix analyzers page display and failing BCT analyzers

## Description

Some BCT analyzers failed with newer numpy because of a bctpy bug (). The issue is closed, but the fix is not in the latest PyPI release (0.6.1), so I patched ls2ci in bct_compat.py and enabled the skipped BCT tests.

I made the analyzers menu scrollable, so all analyzers are visible without zooming out.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5799c7b5f1c1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.