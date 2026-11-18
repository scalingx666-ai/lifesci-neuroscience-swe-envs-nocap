# Issue

**Title:** Add ClipVersatileDiffusion feature

## Description

`HuggingFaceImage` returns a CLIP vision tower's hidden states unprojected, so they do not lie in the shared image-text embedding space that image-conditioned diffusion models such as `Versatile Diffusion
<https://huggingface.co/shi-labs/versatile-diffusion>`_ consume.

`ClipVersatileDiffusion` projects them: `post_layernorm` over every token of the last hidden state, then `visual_projection`. With `normalize=True` (the default) each token is divided by the L2 norm of the CLS token. `token_aggregation` defaults to `None`, keeping every token, so ViT-L/14 yields `(257, 768)` — CLS plus 256 patches.

Construction rejects a `model_name` whose config exposes no vision tower or projection dim, rather than failing later in the extractor.

Tests cover both `normalize` settings and the rejection path.

## What does this PR do?

<!-- Brief description of the change. -->

## Related Issues

<!-- e.g. ,  -->

## Checklist

- [ ] Tests added or updated
- [ ] Docstrings updated for any changed public APIs
- [ ] `pytest` and `mypy` pass locally

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c33774e4a2c8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.