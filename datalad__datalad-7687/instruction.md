# Issue

**Title:** test: xfail test_subsuperdataset_save on newer gits

## Description

The whole point for that "permissions" trick was to ensure that git does not go into submodules and thus we would be "optimized" and not waste cycles where not desired.  But the very fact that it errors out points that it is not the case.

So this provides only taming down for
  
and for a proper solution we better first wait on what git gurus say in
  https://lore.kernel.org/git/ZzyyQpJw-kxJA7IS@bilena/T/#u

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `594d3ae24e9f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.