# Issue

**Title:** Class method to retrieve a default parameters of a class

## Description

Added a class method to Agent, Environment and Neurons to retrieve a class' default parameters.
Changed the default parameters deep copy in the __init__() calls to retrieve the class default parameters for the class in which the __init__ is situated (not the instance's class default parameters, which could belong to a Child class). 
Changed unexpected parameter keys warning to specify class name.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `570b783dbbf4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.