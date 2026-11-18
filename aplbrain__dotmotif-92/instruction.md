# Issue

**Title:** [Neo4j] Fix negation of in/contains operators in Cypher

## Description

!in/!contains operators need their own negation syntax in Cypher.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3a0999873728`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.