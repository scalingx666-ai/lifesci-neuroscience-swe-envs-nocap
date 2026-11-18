# Issue

**Title:** Use inspect.signature in add_movie for GratingMovie

## Description

I had been trying to run LGN simulations with static gratings at various phases, however it seems that varying phase with add_movie does not work, so I fixed it.

Previously, if 'phase' was added as a parameter to add_movie it would not be passed to GratingMovie.create_movie and would be ignored. By using the inspect module, we can ensure that any arguments to GratingMovie.__init__ and GratingMovie.create_movie are automatically supported by FilterSimulator.add_movie.

We also created a test case, the setup of which can be reused to test a variety of functionality of FilterSimulator.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6e2db7a0229e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.