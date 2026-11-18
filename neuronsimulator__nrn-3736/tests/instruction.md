# Issue

**Title:** Fixed a MPI bug with MultiCompartmentReaction which produce membrane currents.

## Description

In `initialize_multicompartment_reaction` when mpi flag is used `reaction_indices` were free after being copied to `all_reaction_indices`. This caused a problem if `set_rxd_current` was called, setting the `initialize_multicompartment_reaction`  flag to FALSE, so  `all_reaction_indices` get set again, having cleared the original  `reaction_indices`.

This fix keeps two copies of reaction indices, one for the process in `reaction_indices` and one for all of the processes in `all_reaction_indices`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1f0d8eb02cfe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.