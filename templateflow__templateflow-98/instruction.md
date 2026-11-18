# Issue

**Title:** add datalad-id for all templates submodules

## Description

Should remove the following error: 
`[ERROR  ] KeyError('id') (KeyError)`
when recursively installing with datalad 0.15.0 from a clone of the repo such as a RIA-store.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `36effc122162`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.