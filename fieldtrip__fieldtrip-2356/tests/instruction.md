# Issue

**Title:** FIX #2352 - open file using ASCII-US encoding

## Description

@schoffelen I wonder whether we should do this more explicitly for other file formats as well. We don't encounter this problem very often, but this certainly not the first time. 

At other places in the code we do it explicitly when reading, for example

```
char(fread(fid, 16, 'uint8=>char'))
```

I think that any piece of code that freads a `char` without explicit specification of the character encoding is at risk.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f3fd993190ea`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.