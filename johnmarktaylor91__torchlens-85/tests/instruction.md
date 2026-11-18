# Issue

**Title:** test(suite): exhaustive test suite expansion (~559 tests)

## Description

## Summary

- Add **64 new toy model** classes and tests covering attention/transformers, containers (ModuleList/Dict), conditional/dynamic ops, normalization variants (LayerNorm/GroupNorm/InstanceNorm), Conv1d/Conv3d, residual blocks, parameter sharing, in-place chains, type casting, scalar/broadcasting, packed sequences, custom autograd, exemption registry stress tests, architecture patterns (VAE, GAN, UNet, TCN, PixelShuffle, PointNet, ActorCritic, TwoTower, DepthEstimator), and **16 adversarial edge-case models** targeting specific torchlens code paths
- Add **12 new real-world model tests**: DistilBERT, ELECTRA, MobileViT, MoE (built-in), T5, BART, RoBERTa, BLIP, Whisper, ViT-MAE, Conformer, SentenceTransformer
- **Merge** `test_real_world_models_slow.py` into `test_real_world_models.py` organized by architecture/modality, using `@pytest.mark.slow` for heavy tests
- Register `slow` pytest marker in `pyproject.toml`
- Add 4 new fixtures (`seq_input`, `token_input`, `input_3d`, `input_1d_seq`) and 5 vis output subdirs

## Test plan

- [ ] `pytest tests/test_toy_models.py -v --timeout=120` — verify new toy model tests
- [ ] `pytest tests/test_real_world_models.py -m "not slow" -v --timeout=300` — verify fast real-world tests
- [ ] `pytest tests/test_real_world_models.py -m "slow" -v --timeout=600` — verify slow real-world tests
- [ ] `pytest tests/ -v --timeout=600` — full regression
- [ ] Review adversarial edge-case failures and decide which need exemptions vs xfail vs fixes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2386742fe851`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.