# Issue

**Title:** GC fixes + exhaustive architecture test coverage

## Description

## Summary

- **GC fixes**: Release `ParamLog._param_ref` on cleanup, add `release_param_refs()` public API, clear `_param_logs_by_module` — allows model GC while log is alive
- **10 GC tests** (`test_gc.py`): weakref lifecycle, memory growth, param ref release, transient data cleanup
- **Exhaustive architecture coverage**: 250 toy models, 185 real-world models, 892 total tests
- **37/38 stress-test computational patterns** from the taxonomy covered (97.4%)
- **RESULTS.md** at repo root: public-facing test results summary with full model compatibility table and pattern coverage matrix

### New toy models (+28)
Autoencoders (sparse, denoising, conv, beta-VAE, CVAE, hierarchical VAE, VQ-VAE), SSMs (simple, selective, gated, stacked), GRU, NiN, channel shuffle, pixel shuffle, partial conv, FiLM, coordinate attention, differential attention, relative position attention, early exit, multi-scale parallel, Gumbel-VQ, end-to-end memory network, RBF, SIREN, multi-task, wide & deep, Chebyshev GCN, prototypical network, ECA, linear attention, FNO (spectral conv), Perceiver, ASPP, ControlNet, EGNN, MAML inner loop, tiny NeRF.

### New real-world models (+35)
GPT-J, GPTBigCode, GPT-NeoX, Funnel Transformer, CANINE, MobileBERT, mBART, ProphetNet, WavLM, Data2VecAudio, UniSpeech, 15 timm architectures (ConvNeXt-v2, NFNet, DaViT, CoAtNet, RepVGG, ReXNet, PiT, Visformer, GC-ViT, EfficientFormer, FastViT, NesT, Sequencer2D, TResNet, VOLO), SigLIP, BLIP-2, Deformable DETR, LayoutLM, TimeSeriesTransformer, ChebConv/SGConv/TAGConv (PyG), RecurrentGemma.

## Test plan
- [ ] `pytest tests/test_gc.py -v` — all 10 GC tests pass
- [ ] `pytest tests/ -m smoke -x` — smoke tests pass
- [ ] `pytest tests/test_toy_models.py -x` — all 250 toy model tests pass
- [ ] `pytest tests/test_real_world_models.py -x` — all 185 real-world tests pass

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a24b53496829`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.