# Issue

**Title:** Truncate HuggingFaceText context to model positional capacity

## Description

## What does this PR do?

Fixes the OPT contextual-embedding crash in `HuggingFaceText` (`facebook/opt-*` jobs hitting a CUDA `indexSelectLargeIndex` / device-side assert).

`_get_data` tokenized with `truncation=True` but no `max_length`, so it fell back to `tokenizer.model_max_length`. OPT reports the HF "infinite" sentinel (~1e30), disabling truncation; long contexts then overflowed OPT's learned position table. 

The fix derives an explicit `max_length` from the model's real positional capacity (memoized in `_get_max_length`) and passes it to the tokenizer, so truncation always engages.

Behavior:
- Models with a real `model_max_length` (gpt2, Qwen, Llama, BERT, T5, rotary models): unchanged.
- OPT/BART (sentinel + offset position table): truncated to capacity; `truncation_side="left"` keeps the target word at the tail.

Co-authored with @jrapin

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `682ec0491075`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.