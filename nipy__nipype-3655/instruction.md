# Issue

**Title:** FIX: evaluate_connect_function should raise error on un-nested imports

## Description

## Summary

if I'm understanding [evaluate_connect_function](https://github.com/nipy/nipype/blob/4d1352ade7171fd5f55eff62cee4c99a4f9cfed1/nipype/pipeline/engine/utils.py#L687) correctly, the _intent_ of the if-clause is to catch errors that arise from calling libraries/modules/functions that were imported at the module level (as opposed to nesting the imports at the function level), and raises a more informative error for those cases. 

I think  gives one example where the if-clause _should_  catch such an error, but doesn't, because the error doesn't start with `"global name"`. So I think it should be okay to make the if-clause more permissive, i.e. just check if the error message ends with `"is not defined"`, then return the extra-informative error message to the user.

What do you think?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fffc1c2fc271`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.