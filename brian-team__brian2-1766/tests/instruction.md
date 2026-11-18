# Issue

**Title:** Fix: Ensure internal variables are checked for name conflicts

## Description

****

### Summary
This fixes a bug where internal variables (like the stochastic `xi_*` variables) were being silently shadowed if a user defined a variable with the same name in their script.

### The Issue
`NeuronGroup` optimizes the list of identifiers it passes to `resolve_all`, often excluding internal variables that aren't explicitly listed in the equations. Since `resolve_all` relies on this list to detect conflicts against the run namespace, it was completely missing conflicts involving internal variables.

### The Fix
I updated `Group.resolve_all` in `brian2/groups/group.py`. The method now explicitly adds `self.variables.keys()` to the set of identifiers being resolved. This ensures that all group variables—internal or otherwise—are verified against the run namespace, regardless of whether the equation parser picked them up.

### Verification
Added a regression test in `brian2/tests/test_issue_1341.py`. It creates a `NeuronGroup` with a forced internal variable conflict and mocks the logger to assert that the warning is actually raised.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4960df7643dc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.