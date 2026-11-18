# Issue

**Title:** WIP:  Allow for enforcing deterministic behavior.

## Description

So here's what I'm thinking:

* config file that has a couple global variables ``_deterministic`` and ``_random_seed``.
* Through ``set_ants_deterministic``, one can turn on deterministic behavior and set a random seed.  
* The random seed is set in numpy and random
* The environmental variable "ITK_GLOBAL_DEFAULT...`` is set to "1".
* In ``ants.registration`` it checks for whether or not the global variable has been set and, if so, checks that the ``type_of_transform`` is one of the ``Repro`` types.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e7413a7afd69`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.