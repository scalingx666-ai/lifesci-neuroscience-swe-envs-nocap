# Issue

**Title:** Adopt windowed approach to spectrum fit notch filtering as the new default

## Description

# PR Description

- Adds the defaults 10s filter length
- Adds filter_kwargs parameter

 #18 

I dont know if this is what you have in mind...

I'm also a bit busy again ( new exams, deadlines approaching etc) but I managed advance this a bit.

What do you mean by (in #35) 

> And perhaps test whether that'd a good idea?

Originally clean line uses like 2-4 second windows with 50% overlap.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4bcde5e46de3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.