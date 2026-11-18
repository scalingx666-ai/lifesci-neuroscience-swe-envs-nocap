# Issue

**Title:** Refactor HuggingFace visual extractors

## Description

## Why this PR?
Right now, 
- HuggingFaceImage takes single Image events and outputs a single frame embedding. 
- HuggingFaceVideo takes Video events, and outputs either multiple frame embeddings if model_name is an image model, or a video embedding if model_name is a video model.

This results in the following issues:
- behavior of HuggingFaceVideo depends on a hard-coded list of video model names: _HFVideoModel.MODELS
- for models like Qwen3-VL which can take as input either images or videos, we can only use one of the two modes (depending on whether the model_name is in _HFVideoModel.MODELS)
- HuggingFaceVideo is very messy, and has a confusing config, as it takes as input a HuggingFaceImage instance

## Changes
HuggingFaceImage can handle both Image and Video events, and **always outputs frame embeddings**
HugginFaceVideo takes Video events, **and always outputs actual video embeddings**
Hence, HuggingFaceVideo does not take a HuggingFaceImage model as input, which considerably simplifies the API

## Usage example
Frame embeddings from videos now use `HuggingFaceImage`:

```python
# before
extractor = ns.extractors.HuggingFaceVideo(
    frequency=2,
    model_name="facebook/dinov2-large",
)

# now
extractor = ns.extractors.HuggingFaceImage(
    event_types=("Video"),
    frequency=2,
    model_name="facebook/dinov2-large",
)
```

Native video embeddings now configure `HuggingFaceVideo` directly:
```python
# before
image = ns.extractors.HuggingFaceImage(model_name="MCG-NJU/videomae-base", keep_in_ram=False)
extractor = ns.extractors.HuggingFaceVideo(
    frequency=2,
    model_name=image
)

# now
extractor = ns.extractors.HuggingFaceVideo(
    frequency=2,
    model_name="MCG-NJU/videomae-base",
)
```

## Test plan
- `../.venv/bin/python -m pytest neuralset/extractors/test_video.py`
- `../.venv/bin/python -m pytest neuralset/extractors/test_image.py -k 'not openai_clip'`
- `../.venv/bin/python -m pytest neuralset/events/transforms/test_transforms.py::test_similarity_splitter`
- `../.venv/bin/python -m pytest brainai/extractors/test_image.py::test_extended_video_image_latent`
- Full focused run `../.venv/bin/python -m pytest neuralset/extractors/test_image.py neuralset/extractors/test_video.py` still has the existing `openai/clip-vit-base-patch32` hidden_states regression in the CLIP tests; the updated video tests pass.

Made with [Cursor](https://cursor.com)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8778d6c1ea42`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.