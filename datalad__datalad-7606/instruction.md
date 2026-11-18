# Issue

**Title:** ENH: add submodule URL candidates by URL-rewrite to match parent protocol

## Description

Attempt at fixing #7604 

This PR adds a new submodule URL candidate by simply matching the protocol to the parent dataset one. 

It could be extended to provide more alternative URLs, such as matching protocol and hostname (and git platform user) of the parent one, so if a dataset is recursive forked to another server it can be recursively installed from that new server without changing the `.gitmodules` URLs.

I added a dependency, but if there are internal code to flexibly rewrite git URLS I would rather use these.

There are many changes which are triggered by pre-commit isort, though it seems not applied to the master branch.

Mainly looking for feedback before moving further.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `77563f92ec51`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.