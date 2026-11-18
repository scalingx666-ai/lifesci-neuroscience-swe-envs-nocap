# Issue

**Title:** Adapt selectors to use choosable attributes as criterion

## Description

The selection tools are very convenient tools, but they could be made a bit more general if one could say which attribute of an individual to choose from.

Possible use cases are IBEA or HypE algorithms where an indicator function is used as an additional "fitness". With this patch request, the available selection tools could also be used for such cases.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `232ed17142da`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.