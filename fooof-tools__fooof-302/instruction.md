# Issue

**Title:** [BUG] - Fix description of time constant estimation

## Description

We have a function the repo to estimate 'timescales', added in here. I happened to notice that the function we have here described the calculation as being estimated from the knee _parameter_, whereas Richard's work estimates it from the knee _frequency_ - which I assume is correct? If so, this is currently incorrectly described here, and this PR updates that.

This is what I'm following from Richard's work: 
https://github.com/rdgao/field-echos/blob/master/echo_utils.py#L65

I know the "knee frequency" calculation is an estimation - this function should at least be updated to describe the correct parameter - should we also add a bit of note describing it more and/or referencing this to Richards paper? Thoughts, @rdgao?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d63aae0bc925`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.