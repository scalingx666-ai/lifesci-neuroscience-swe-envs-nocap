# Issue

**Title:** Neatened things up to be more reader-friendly

## Description

Hey fellas. This isn't a proper pull request because I haven't done any tests (I'm not actually sure what to do re standards for this library?); rather, I've just I've just made the registrations.py file a little more reader-friendly.

# Motivation

I'm trying to use ANTsPy to register light-sheet microscopy data of larval zebrafish brains, but am having limited success. I'm having to dig through the code to understand what arguments go where, which I find easier to do after renaming and reorganising a few things.

My hope is that now, if a person wants to understand a specific type of transform, they can read how the arguments `args` are constructed and work backwards from there.

# What I've tweaked

- by comparing this [Anatomy of an antsRegistration call](https://github.com/ANTsX/ANTs/wiki/Anatomy-of-an-antsRegistration-call) post with the `type_of_transform="antsRegistrationSyN[s]"` case I was able to recover the full length names of **some** of the arguments; I used this to rename some arguments. I've also renamed some of the shorter-named variables.
- some of the variables had redundant or tautologous expressions, like `if [Boolean Variable] == True`, so I simplified those.
- I aligned the arguments in the list format so that they're easier to read (though possibly less PEP8-friendly).
- I've also noticed that the type of transform `"SyNLessAggro"` seems to do exactly the same as `"SyNAggro"`, so I've added a comment to that in the function description.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `823b68a306f4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.