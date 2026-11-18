# Issue

**Title:** Add !contains and !in constraint support

## Description

.

This PR adds support for the negated `in` and `contains` operators for assigning attribute constraints by prepending them with the `!` not operator:

```C
A -> B

A.name !contains "blah"
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `eef31224117e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.