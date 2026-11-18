# Issue

**Title:** Maintenance: dx.doi.org → doi.org

## Description

A proper DOI link starts with `https://doi.org`, see https://www.doi.org/:
> DOIs include a prefix (prefixes always start with `10.`) and a suffix, separated by a forward slash (`/`). Prefacing the DOI with `doi.org/` will turn it into an actionable link, for example, [**https://doi.org/10.47366/sabia.v5n1a3**](http://doi.org/10.47366/sabia.v5n1a3). Clicking that link will ‘resolve’ it, i.e. redirect to the latest information about the object it identifies, even if the object changes or moves.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ba80d6cef202`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.