# Issue

**Title:** added type annotation support for docs

## Description

Hi,

Suite2p has been getting a lot of type annotations, which make it easier to maintain and decrease the length of the docstrings (sometimes by a lot!), but those annotations haven't been showing up in the sphinx-generated online documentation.  That means that only by looking at the source code can you understand how the functions work.  This commit uses the sphinx-autodoc-typehints package to add type annotations to the docs, so everyone can see!

Best wishes,

Nick

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a675c5df197b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.