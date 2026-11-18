# Issue

**Title:** Fix the docstring of isDominated function

## Description

### Related issue


### Summary
Fix the docstring of `isDominated` funciton.

As far as the code described below is concerned, when all `wvalues2`'s value are greater than all `wvalues1`'s ones, this function returns `True`.
```
        elif self_wvalue < other_wvalue:
            not_equal = True
    return not_equal
```
I suppose it is the opposite of the current docstring description.
I also think the current description below is correct.
```
    :returns: :obj:`True` if wvalues2 dominates wvalues1, :obj:`False`
              otherwise.
```

This is my first pull request for Deap.
I would appreciate it if you review it, and let me know if you find any problems on this pull request.

Thank you very much!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bc77eface9f4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.