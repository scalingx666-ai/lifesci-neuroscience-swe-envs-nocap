# Issue

**Title:** Automorphism notation (===)

## Description

Introduces the `===` notation to indicate that two nodes are "interchangeable" in the results.

This returns 2X results:

```
A -> C
B -> C
```

This returns 1X result:

```
A -> C
B -> C

A === B
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e81677de1b25`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.