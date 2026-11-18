# Issue

**Title:** Dynamic node constraints

## Description

This pull request adds support for dynamic constraints, or node/edge constraints that reference other nodes. For example,

```rb
A -> B
B.radius > A.radius   # newly available
B.radius < 100
```

### DSL
- [x] Dynamic node constraints
- [x] Node constraints in macros

### NetworkXExecutor

- [x] Node constraints

### Neo4jExecutor

- [x] Node constraints

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `adadde97adb4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.