# Issue

**Title:** Macros

## Description

Macros are awesome.

```
in_love_with(A, B) {
    A -> B
}

hates(A, B) {
    A -| B
}

love_triangle(A, B, C) {
    in_love_with(A, B)
    in_love_with(B, C)
    in_love_with(C, A)
}

complex_love_triangles(A, B, C, D) {
    love_triangle(A, B, C)
    love_triangle(C, A, D)
    hates(D, B)
}
```

And then declare it with:
```
complex_love_triangles(john, paul, george, ringo)
complex_love_triangles(stevie, lindsey, christine, mick)
```

Before macros, you had to do this:

```
# Complex love triangle 1:
john -> paul
paul -> george
george -> john
ringo -> george
john -> ringo
ringo -| paul

# Complex love triangle 2:
stevie -> lindsey
lindsey -> christine
christine -> stevie
mick -> christine
stevie -> mick
mick -| lindsey
```

...and if you ever changed the definition of a love triangle... you're SOL.

So... this is better.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0a6a0b8a139e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.