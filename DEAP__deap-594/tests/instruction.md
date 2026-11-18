# Issue

**Title:** Inversion Mutation

## Description

Adds an inversion mutation. . Basically, select two points and reverse the order between the points. It's handy for when adjacency is really important as it ends up being less destructive (if that's what you're looking for). 

Notes:
- It is possible that the indices are the same or adjacent. This scenario is ignored and results in an unmodified individual
- The function was tested locally, but there are no unit test provided. I am not seeing any unit tests for any other genetic operators 
- The `end_point` is **not** selected with `random.randrange(start_index, size)` as that provides a different distribution of selected indices, which is bad. 
- I originally wrote the swapping with slicing, but thought it was too ugly.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f4b77759897d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.