# Issue

**Title:** Macro attributes

## Description

Support for attributes and constraints _from inside_ a macro.

This enables behavior like this:

```
avuncular(A) {
    A.friendliness >= 0.9
    A.joviality >= 0.5
}

A -> B
avuncular(A)
```


Or this:

```
loveTriangle(A, B, C) {
    A -> B [type="loves"]
    B -> C [type="loves"]
    C -> A [type="friend"]

loveTriangle(A, B, C)
```

- [x] Edge attributes
    - [x] implementation
    - [x] tests
- [x] Node attributes
    - [x] implementation
    - [x] tests

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9aa880219632`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.