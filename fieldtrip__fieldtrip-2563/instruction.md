# Issue

**Title:** FIX - preserve Matlab path order in qsubfeval > getcustompath

## Description

This line in getcustompath erroneously reordered the Matlab path into alphabetical order:
```matlab
setdiff(p, f)
```
Proof of concept:
```matlab
p={'ccc','bb','a'};
f='bb';
>> setdiff(p, f)

ans =

  1×2 cell array

    {'a'}    {'ccc'}
```

There are two simple solutions:

1. Use 'stable' option that was introduced in R2012
```matlab
>> setdiff(p, f, 'stable')

ans =

  1×2 cell array

    {'ccc'}    {'a'}
```

2. Use:
```matlab
>> p(~strcmp(p, f))

ans =

  1×2 cell array

    {'ccc'}    {'a'}
```
I have chosen option 2, but either one is good to me...

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `41dce99fd101`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.