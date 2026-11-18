# Issue

**Title:** Fix HuggingFaceText wrong unpadding for some models

## Description

## Summary

`HuggingFaceText._get_data` set `_pad_id = tokenizer.eos_token_id` and counted pads via `sum(input_ids == _pad_id)`. For tokenizers where `pad_token_id != eos_token_id` (Pythia, GPT-NeoX, ...), this counted **0 pads** for any padded batch, so `hidden_state[:, :-n_pads]` left all pad positions in place and the target-word slice summed in hundreds of masked-pad activations.

With `aggregation='sum'`, short-context events batched with long-context neighbors got inflated by O(padded_seq_len) — ~500× on CPU, `inf` on GPU. Single-event re-runs looked clean, so the bug only surfaced in batched runs.

## Fix

- **`_pad_id` removed** — pad counting now uses `attention_mask`, the source of truth for what the model actually ignored. Robust to any further pad/eos id confusion.
- **`padding_side="right"` pinned** on the tokenizer so the trailing-block tail slice `[:, :-n_pads]` stays valid for tokenizers that default to left-padding.
- **`MapInfra.version` bumped v6 → v7** to invalidate affected caches.

## Tests

- `test_batched_target_slice_excludes_pads` (GPT-2): asserts that a short-context Word batched with a long-context neighbor produces the same output as the same Word forwarded alone.

Made with @jrapin

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `17ad2f8b1029`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.