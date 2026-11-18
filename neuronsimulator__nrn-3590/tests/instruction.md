# Issue

**Title:** Use `derivimplicit` if `cnexp` solution contains an unimplemented function

## Description

.

We check the `cnexp` solution for any "unimplementable" features (such as the presence of the Lambert W function), and raise a warning to the user that NMODL will use `derivimplicit` instead.

Note that we do not perform this check in the Python code itself (notably `ode.py`) because it isn't aware of what is and isn't implemented in NEURON.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `28d36120492c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.