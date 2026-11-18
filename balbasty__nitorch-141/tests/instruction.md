# Issue

**Title:** Fix registration with integer (discretized) moving images

## Description

Hard-discretizing an image (`-d N`) turns its data into an integer
tensor. Several places assumed image data was floating point:

- PairwiseRegister.fit used the moving image's dtype for the affine and
  nonlinear parameters, so they became integer tensors and
  `linalg.lmdiv` failed ("Expected a floating point ... Got Long").
  Parameters now use the first floating dtype among moving/fixed,
  falling back to the default dtype.
- Image.pull / pull_grad / grad interpolated or differentiated the raw
  integer data (and cast the mask to the integer dtype), which failed in
  grid_grad. They now operate on a floating point copy.
- Image repr always printed `dtype=int32` for non-float32 images instead
  of the actual dtype.

Claude-Session: https://claude.ai/code/session_014dBjaVsinW3dpQVrLPp5GS

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ea49d59d47ba`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.