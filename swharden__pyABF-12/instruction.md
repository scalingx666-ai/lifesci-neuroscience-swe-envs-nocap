# Issue

**Title:** ABFCore: Don't error out on unknown epoch types

## Description

The warn method has with python 3.6 the following declaration
warnings.warn(message, category=None, stacklevel=1, source=None)
and therefore the epochType is wrong here.

Add the epoch type to the message instead.

Broken since 9bbf45bd (protocol generation, 2018-06-19).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d5fdcdfff2c9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.