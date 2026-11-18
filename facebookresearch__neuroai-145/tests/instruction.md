# Issue

**Title:** Prefetch HuggingFace extractor models

## Description

## Issue

Large batches of HuggingFace extractor jobs can start at the same time and race while downloading the same model files. In practice this can leave workers seeing incomplete cache state, with errors such as unable to load a vocabulary or missing sharded weight files like `model-00003-of-00004.safetensors`.

## Changes

- Prefetch the HuggingFace repo snapshot in `HuggingFaceMixin.model_post_init()`.
- Prefer the cached snapshot path first via `snapshot_download(..., local_files_only=True)`, then fall back to a normal `snapshot_download(...)` only when the cache entry is missing.
- Forward only `revision` from `hf_config.model_kwargs` / `processor_kwargs` into `snapshot_download`, and prefetch each distinct downstream revision used by model/config and processor loads.
- Load model configs, model weights, and processors with `local_files_only=True` after snapshot warm-up so extractor workers read from the populated cache instead of racing on remote downloads.
- Remove the previous packaged HuggingFace repo whitelist and the eager Transformers model/processor class checks from `model_post_init`.

## Usage impact

Existing extractor construction stays the same:

```python
extractor = neuralset.extractors.HuggingFaceImage(
    model_name="Qwen/Qwen3-VL-8B-Instruct",
)
```

The first instantiation populates the HuggingFace cache if needed. Subsequent instantiations resolve the cached snapshot locally and model/processor loading is cache-only.

## Benchmark

Measured `HuggingFaceMixin(model_name=...)` construction after Python imports, using a fresh isolated cache folder (`HF_HOME=/tmp/hf_prefetch_bench_p703g4ul`). Each model was instantiated three times in the same process: first call populated the cache, second/third calls used the local-only snapshot path.

| Model | Snapshot size | First call | Second call | Third call |
| --- | ---: | ---: | ---: | ---: |
| `hf-internal-testing/tiny-random-bert` | 26.9 MB | 1.766 s | 0.000305 s | 0.000092 s |
| `sshleifer/tiny-gpt2` | 4.6 MB | 0.470 s | 0.000204 s | 0.000092 s |
| `sentence-transformers/all-MiniLM-L6-v2` | 888.1 MB | 1.690 s | 0.000246 s | 0.000089 s |
| `facebook/dinov2-small` | 168.4 MB | 5.531 s | 0.000255 s | 0.000096 s |
| `google-t5/t5-small` | 2.09 GB | 3.510 s | 0.000295 s | 0.000102 s |
| `distilbert/distilgpt2` | 2.95 GB | 3.672 s | 0.000360 s | 0.000110 s |
| `facebook/wav2vec2-base` | 362.8 MB | 0.867 s | 0.000238 s | 0.000087 s |
| `google-bert/bert-base-uncased` | 3.22 GB | 2.321 s | 0.000333 s | 0.000102 s |
| `FacebookAI/roberta-base` | 2.62 GB | 2.641 s | 0.000246 s | 0.000113 s |
| `openai-community/gpt2` | 5.25 GB | 3.488 s | 0.000230 s | 0.000095 s |

Notes:

- Total isolated cache size after the run was 18.8 GB.
- Downloads were unauthenticated, so first-call timings include normal network variance and Hub rate-limit behavior.
- The benchmark targets `model_post_init`/snapshot behavior only; it does not load model weights into memory.

## Test plan

- `cd neuralset-repo && ../.venv/bin/python -m pytest neuralset/extractors/test_base.py -k 'huggingface or hf_aggregate_tokens'`
- `cd neuralset-repo && ../.venv/bin/python -m mypy neuralset` currently fails on existing unrelated issues in `neuralset/segments.py`, `neuralset/extractors/neuro.py`, and missing `neuralfetch` imports in `neuralset/events/transforms/test_transforms.py`.

Made with [Cursor](https://cursor.com)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b4c6517562b7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.