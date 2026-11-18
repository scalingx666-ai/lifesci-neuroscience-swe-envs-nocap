# Issue

**Title:** Add macro edge aliases

## Description

This adds support for complex edge constraints in macros:

```py
decreasing_edge_weights(a, b, c) {
    a -> b as ab
    b -> c as bc
    ab.weight > bc.weight
}

...
```

In increasing levels of challengingness:
- [x] Add support for simple (edge-value) edge constraints in macros
- [x] Add support for dynamic (edge-edge) edge constraints in macros
- [x] Extend support for recursive calls to macros with simple constraints
- [x] Extend support for recursive calls to macros with dynamic constraints
- [x] Update documentation

This  and finishes work started in #119.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `07e3b7cf267b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.