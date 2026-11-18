# Issue

**Title:** Unify HuggingFace model loading and more

## Description

## Why this PR?

- Model build, device and dtype handling is extremely messy and ad-hoc in our HuggingFace extractors, and different across modalities.
- For some HF models, AutoModel/AutoProcessor do not work, you need to load a specific model class such as VivitModel. Currently this behaviour is hardcoded, meaning we only support a fraction of HF models
- We currently do not support giving arguments such as trust_remote_code to the HF model build, which forced people such as @shouhamdi to create custom subclasses for each edge case
- device="accelerate" was an alias for {"device_map": "auto" and "dtype=float16"}, which is quite arbitrary and caused bugs in HuggingFaceImage (see )

## Summary

Unifies HuggingFace model loading across text, audio, image, and video extractors by moving shared model construction options into a common `hf_config` and centralizing model instantiation in `HuggingFaceMixin`. This gives us full flexibility on model instantiation

## What Changed

- Added `HuggingFaceMixin.load_model()` and shared model/processor caches so text, audio, image, and video extractors use the same HuggingFace loading path.
- Restored explicit `device` and `dtype` fields on `HuggingFaceMixin`: `device="auto"` resolves to CUDA when available otherwise CPU, while `device="accelerate"` is the opt-in path that forwards `device_map="auto"` to HuggingFace.
- Added `HuggingFaceConfig` for HuggingFace class selection and escape-hatch kwargs: `model_cls_name`, `processor_cls_name`, `model_kwargs`, and `processor_kwargs`.
- Added public `HuggingFaceConfig.HF_CLASS_DEFAULTS` so known model-name patterns can resolve non-standard model/processor classes without modality-specific `if model_name` branches.
- Treat audio feature extractors and text tokenizers as shared HuggingFace processors, so modality-specific processor kwargs and caching follow the same path.
- Simplified image and video extractors by removing wrapper classes, merging `BaseImage` into `HuggingFaceImage`, and removing `_HFVideoModel`, `layer_type`, xclip-specific handling, and model-name-based frame defaults.
- Made native `HuggingFaceVideo.num_frames` required and warn when it differs from `model.config.num_frames` when available.
- Kept HuggingFace repo existence validation and added validation errors for misplaced `device_map`/`torch_dtype` entries in `hf_config.model_kwargs`; users should use `device`/`dtype` instead.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `656d8513b585`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.