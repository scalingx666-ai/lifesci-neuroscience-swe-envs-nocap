# Issue

**Title:** Adds _extended_purview attribute to Causal Links + pretty formatting of extended_purview

## Description

In actual causation, when computing causal links, it often occurs that purviews have the same alpha. Currently, the `find_causal_link()` method returns one arbitrary purview from the ones with maximum alpha.
The `find_causal_link()` method now adds a hidden attribute `_extended_purview` to the returned `CausalLink` with all the purviews with equivalent maximum alpha which are not supersets of each other. For example, if purviews (A,B), (B,C), (A,B,D) have the same maximum alpha, the extended purview is ((A,B),(B,C)).

I've also added pretty formatting methods to print the CausalLinks when they have extended purviews so they look like:
α = 0.415  [[S1, A], [A, D]] ◀━━ [M1]

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d96528924d29`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.