# Issue

**Title:** DOC: make mentioning of pipeline_name consistent

## Description

- we really should not advocate having ```_``` as a separator, so I made example to use 'pipeline1-v1' and 'pipeline2`.  This should make it much more consistent with how we name in BIDS where '_' is a separator between entities.
- we had <pipeline> and <pipeline_name> (as we used in other places). I unified to <pipeline_name> although would not mind going to <pipeline> or introducing (expclitly) that '<pipeline>' means '<pipeline_name>[-<variant>]'

initially prompted by looking at  oddly looking example in common principles with the `pipeline_1`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5e68e07fee86`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.