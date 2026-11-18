# Issue

**Title:** add multi tissue correction to tortuosity constraint

## Description

This commit adds the possibility to correct the tortuosity constraint
by taking into account the multi-tissue properties of the employed
model. In order to do this, the new syntax of the
`set_tortuous_parameter` method of the `MultiCompartmentModel` class is
extended in such a way that it can take as input the S0 of the tissues
modelled by the intra-cellular and the extra-cellular compartments.
Backward compatibility is maintained.

This PR substitutes #84 .

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ff5067f2cad4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.