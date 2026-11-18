# Issue

**Title:** Data Element API

## Description

This is a change that I had predicted while discussing #5. This adds a new API for low-level reading and manipulation of data elements in a volume. It will play a more important role in the `IntoNdArray` API, because this replaces the previous constraints into new ones. `PodTransmutable` is no longer needed as part of the public API, but is still used underneath.
The new `DataElement` trait has been manually implemented for each type to ensure the most appropriate reading and transformation procedures. The new `LinearTransform` trait also sets a backbone for potential optimizations in the future, as it enables the `v * slope + intercept` operation to be performed at a large scale.

I will leave it here for a few days for potential feedback, until I merge and release. @nilgoyette your feedback would be much appreciated. :slightly_smiling_face:

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `431b0360b285`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.