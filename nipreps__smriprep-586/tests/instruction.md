# Issue

**Title:** test: Make workflow-building tests more resilient

## Description

#585 is a relatively constrained change, but verifying test coverage is problematic because the tests we use for precomputed derivatives manually constructed the precomputed dictionary. This PR makes the following changes:

* Wraps `collect_derivatives()` in a `collect_anat_derivatives()` that performs the multi-dataset load that the workflow builder performs, so this can be run in tests identically to how it's run at runtime.
* Constructs derivative skeletons flexibly based on the keys we want to find in the precomputed dictionary.
* Calls `collect_anat_derivatives()` on generated skeletons.

Additionally:

* This updates how derivatives are merged, since one transform found in a later derivative would clobber all transforms found in an earlier derivative. There was a judgment call here on what to do if a forward transform was found in one derivative and a reverse in another. I chose to merge those, but you could argue that combining across derivatives is dangerous. The use case is definitely rare, so I just made a call, but I'm as happy to reverse it.
* Reduced the number of permutations of precomputed derivatives to 2N+2 (each one, all but each one, all, none)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6a83b4686953`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.