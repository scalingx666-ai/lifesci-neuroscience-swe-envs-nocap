# Issue

**Title:** Remove sort filter call from dataview template

## Description

The "sort" filter in the DataView template was supposed to sort Stacks but used the Stack objects instead of their ids. This lead to the Stacks ending up in a somewhat random order.

Since the stacks already come in sorted, no sorting needs to be done here.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `86efb2b0eedb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.