# Issue

**Title:** feat(e2e/gemm): CK fp8 a8w8 block-scale GEMM tuning skill + head-prio…

## Description

…rity + routing

Add the verified CK playbook for sglang fp8 block-scale GEMM and wire it in:

- knowledge/gemm_tuning/fp8_gemm_tuning_sglang_aiter.md: new skill — capture live (M,N,K) -> aiter CK tuner (gemm_a8w8_blockscale_tune.py --libtype both --mp) -> reversible fp8_utils Triton->CK overlay + AITER_CONFIG_GEMM_A8W8_BLOCKSCALE.
- e2e_workflow.js: add head_priority (fast-mode) to pull the GEMM head to the front.
- roles/op_benchmarker.md: route fp8 a8w8 blockscale to the CK skill + general skill-discovery rule (ls knowledge/gemm_tuning, follow any matching skill).
- knowledge/gemm_attention_backends.md: class->ranked table routes sglang fp8 a8w8 blockscale to the CK skill.
- knowledge/learned/INDEX.md + fp8-a8w8-blockscale-overlay-gfx942.md: record the CK regime-split (decode M<=256 ~3.4-4x CK; prefill stays Triton) and the M-routed overlay (SGLANG_CK_BLOCKSCALE_M_MAX=256).

Validated on Qwen3-14B-FP8, sglang TP=2, 2x MI300X (gfx942): baseline 830 -> 1862 tok/s (+124.5% e2e, independent Director A/B), gsm8k clean.

<!--
Thanks for contributing a pull request, we appreciate you!

If this PR fixes an issue, please reference it, e.g., ''.

You can delete this comment.
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0a3ca8ad9ade`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.