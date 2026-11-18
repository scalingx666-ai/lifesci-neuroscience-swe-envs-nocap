# Issue

**Title:** PERF: Only clone on read if needed

## Description

As noticed in #856 , image_read is pretty slow for large images. Part of this is inherent to NIFTI images, but it's made worse by always cloning the input.

So I added a check whereby we only clone if the input pixel type doesn't already match the output type

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c4433c20c392`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.