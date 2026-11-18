# Issue

**Title:** typos and broken links in the API documentation

## Description

I found 2 small problems with links on the [API documentation page](https://www.neurovault.org/api-docs):
1. in the example for `/api/images/{pk}/`, the pk value in the visible text and the value in the link don't match, and neither work. 
2. in the examples for `/api/collections/{pk}/` and `/api/collections/{pk}/images`, the pk value in the visible text is 20, but the value in the link is 287.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `294039e95b9d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.