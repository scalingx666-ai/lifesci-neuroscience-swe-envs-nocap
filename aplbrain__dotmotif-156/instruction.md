# Issue

**Title:** Add impossible constraint validator

## Description

Now checks things at parse-time like,

```rust
A -> B
A.size > B.size
A.size < B.size
```

Fails because of an impossible constraint.

Also can check this "across" automorphisms both implicit and explicit:


```rust
A -> B
B -> C
A === B

A.type = "big"
B.type = "small"
```

Fails because `A.type` and `B.type` are explicitly isomorphic.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9fa85792295a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.