# Issue

**Title:** [ENH] Deprecate 89+ string for default age column, increase expressiveness of column definitions in sidecar files

## Description

This is a minimal change to column JSON definitions to permit them to be as expressive as JSON schema for defining TSV columns. This adds:

1) `Format`, which covers both `type` and `format`, given that all TSV values are strings until cast by a parser.
2) `Minimum` and `Maximum`, which are used for some values. Here I permit them also to be strings, on the grounds that someone might want a minimum/maximum datetime.

This also deprecates the string "89+" for ages above 88, instead setting a `Maximum` of `89`. It is expected that a validator implementing this will carve out an exception for `age` for 89+. The alternative would be something along the lines of:

```
anyOf:
  - type: number
  - type: string
    enum:
      - "89+"
```

Adding the equivalent of `anyOf` to JSON sidecar column descriptions would be excessive complexity. Looking at the existing uses of `anyOf`, two are degenerate (`anyOf: {type: string}`) and one allowed strings or numbers, which is equivalent to `type: string` for TSV values.

At this point, this PR does *not* attempt to adopt a single convention for schema-defined and sidecar-defined columns. I think we probably should, and posted some options in 

- 
- 
-

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7ba7e67af12d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.