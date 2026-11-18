# Issue

**Title:** feat: SegFormer3D — hierarchical transformer for 3D medical image segmentation

## Description

## Summary

Native PyTorch implementation of SegFormer3D (Perera et al., CVPR 2024 Workshop) — a lightweight hierarchical vision transformer with an all-MLP decoder for 3D medical image segmentation.

### Architecture
- **Encoder**: 4-stage MixTransformer with overlapping patch embeddings, efficient self-attention (spatial reduction for O(N²/R²) complexity), and MixFFN with depth-wise 3D conv for positional encoding
- **Decoder**: All-MLP — upsamples multi-scale features, concatenates, linear projects to n_classes
- **~4.5M params** in default (small) config — 33x fewer than SwinUNETR

### Size Variants
- `tiny`: embed_dims=(16, 32, 80, 128) — ~1.5M params
- `small` (default): embed_dims=(32, 64, 160, 256) — ~4.5M params
- `base`: embed_dims=(64, 128, 320, 512) — ~18M params

### Usage
```python
from nobrainer.models import get
model = get("segformer3d")(n_classes=50)
```

### Evaluation Pipeline
Added to synthseg_evaluation config alongside unet, swin_unetr, segresnet, kwyk_meshnet.

## Test plan
- [x] 9 unit tests (output shapes 32³/64³, param counts, registry access)
- [ ] CI

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `359d61a26ead`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.