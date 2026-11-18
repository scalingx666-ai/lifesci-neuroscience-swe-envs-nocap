# Issue

**Title:** enh(metaschema): require and constrain `inherit` in associations + provide it for atlas _description.json

## Description

Enforce that every entry under `meta.associations` declares `inherit`, and that its value is `true` when the target extension is `.json`, `.tsv`, `.bval`, or `.bvec` and `false` otherwise. Also add the previously-missing `inherit: true` to `atlas_description`.

This is an alternative to a pure human product of
- #2478

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4523097f4cd9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.