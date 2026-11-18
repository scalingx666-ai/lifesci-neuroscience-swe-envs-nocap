# Issue

**Title:** Fix constraint and Cypher handling

## Description

This fixes a few places where constraints could get mangled on their way from the parser to an executor.

- keeps multiple dynamic edge comparisons as separate triples instead of flattening them together
- makes both NetworkX and Neo4j evaluate every dynamic edge comparison
- escapes Cypher values instead of dropping raw strings into the query
- gives parallel motif relationships distinct Cypher variables while leaving the usual single-edge names alone

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ae2d431232a0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.