# Issue

**Title:** Reduce Parallel Task Starvation + Better Parallel Progress Bar

## Description

We use chunks of 100 skeletons (or num labels // parallel if num labels // parallel < 100) to reduce task starvation towards the end of a run. Typically, one unlucky process gets a soma or glia and the others quickly complete, leaving a bunch of work that they could be doing on the table. Chunking makes this a lot better. This isn't task stealing, but it's much better.

 (though it is less efficient than that approach).

We also implement a nice progress bar for parallel operation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ac13ec75b234`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.