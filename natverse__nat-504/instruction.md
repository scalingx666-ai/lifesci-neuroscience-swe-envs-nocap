# Issue

**Title:** Fix/matching by col numeric

## Description

* 
* but we still need to sort out numeric ids like 1e5, since:
```
> as.character(1e5)
[1] "1e+05"
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `49d578d65c52`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.