# Issue

**Title:** [ENH] Add fetch_bazinet_assortavity + a few minor changes

## Description

This Pull Request adds a `fetch_bazinet_assortativity` function. 

It also incorporates a few minor changes:

- It adds a reference to the docstring of the `fetch_hansen_manynetworks` function.
- It fixes a `ValueError` in `get_modularity_z`, fixing issue . 
- It fixes an issue in `parcels_to_vertices` where np.nan values were converted to the lowest possible integer values when the type of the parcellated data was `int`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `202b98afafc3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.