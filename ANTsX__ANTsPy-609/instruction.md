# Issue

**Title:** ENH: support resampling multi-channel images

## Description

This PR adds support for multi-channel images in `resample_image`. The docstring says it's supported and there has pretty much always been an exception raised for multi-channel, so I think I just never got around to implementing it.

This implementation is the simplest - it just splits the channels and resamples on each of them individually. I think the ants function `ResampleImage` supports vector images natively, so that may be preferred in the future.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `54ec16ef9942`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.