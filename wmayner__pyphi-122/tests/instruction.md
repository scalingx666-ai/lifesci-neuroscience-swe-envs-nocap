# Issue

**Title:** New Subsystem With Forward and Backward TPMs

## Description

### Subsystem now contains forward and backward TPMs.

#### Three main new methods were added to subsystem.py:
 1. sia - calculates sia for the current subsystem, previously done with backwards.sia
 2. distinction - creates a distinction (Concept object) from the current subsystem and a given mechanism, previously done manually
 3. all_distinctions - creates a CauseEffectStructure containing all candidate distinctions for a subsystem, previously done with backwards.compute_combined_ces

#### Other changes:
 - backwards.py is no longer used, so it was deleted
 - methods that previously required both backward and forward subsystems were updated to use just one
 - node class also was updated to have both backward and forward TPMs
 - some refactoring was done of repertoire.py, so that the methods in subsystem.intrinsic_information call self.forward_repertoire and self.unconstrained_forward_repertoire, which then call their respective repertoire methods. This allows for the caching to work there, and also eliminated the need for the directional dispatch methods in repertoire.py.
 - validate.py was updated for subsystem to only check the forward TPM (should it check both?)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6b83cbdbbcdc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.