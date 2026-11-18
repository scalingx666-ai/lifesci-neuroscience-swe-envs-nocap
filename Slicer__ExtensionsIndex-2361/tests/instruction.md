# Issue

**Title:** MorphoDepot: update scm_url after repo transfer to SlicerMorph

## Description

The `MorphoDepot` extension repository was transferred from `MorphoCloud/SlicerMorphoDepot` to `SlicerMorph/SlicerMorphoDepot` a few weeks ago. This updates `scm_url` in `MorphoDepot.json` to the new address.

`scm_revision` is unchanged (`main`, which exists on the new repo). The old URL still redirects, so this is a correctness/clarity update.

cc the SlicerMorph maintainers.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a216b726dd8d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.