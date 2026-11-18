# Issue

**Title:** Fix handling of null elements in xyzmatrix.list

## Description

* actually test these cases as well

example from fafbseg
```
> fn=flywire_nuclei(c("720575940613259167", "720575940625038394", "720575940635678832", 
+                    "720575940636680282"), rawcoords = T)
Error: Problem with `mutate()` input `..1`.
`..1 = across(ends_with("position"), function(x) xyzmatrix2str(flywire_nm2raw(x)))`.
x Can't convert <list_of<integer>> to <list<integer>>.
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bfee840a2995`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.