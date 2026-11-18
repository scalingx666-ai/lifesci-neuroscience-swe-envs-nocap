# Issue

**Title:** Add unrolling of FROM iteration variables

## Description

Here's a remarkably ~stupid~ simple fix for #3593.

~It basically uses a regex to replace any remaining (after the `IndexRemover` runs) instances of the iteration variable by its actual value.~

~I've also replaced the `PROCEDURE` block used by the `create_statement` by a `KINETIC` one, because a `PROCEDURE` cannot handle statements such as `~ a << (b*c[0])`.~

**UPDATE**: no more regexing! Now we just insert a `LOCAL` variable that has the value of the current iteration of the loop. This assumes that assignments to iteration variables is not supported (NOCMODL rejects it OOTB, so I think for all intents and purposes we can disregard assignments).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9a25a5719413`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.