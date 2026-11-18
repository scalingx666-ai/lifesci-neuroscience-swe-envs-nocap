# Issue

**Title:** Support image events in HuggingFaceVideo

## Description

## Summary
- Extends `HuggingFaceVideo` to accept `event_types="Image"` and encode each image as a static repeated-frame clip with `num_frames` frames.
- Reuses the existing native video model prediction, token aggregation, and layer aggregation path for both real video clips and static image clips.
- Adds image-aware cache keys and a focused non-network test that verifies repeated static clips are sent to the video model.

## Issue Addressed
`HuggingFaceVideo` previously only accepted `Video` events, so image stimuli could not be embedded with native HuggingFace video models. This change lets image events be passed through the same video model path by converting each image into a static clip.

## Usage Example
```python
extractor = neuralset.extractors.HuggingFaceVideo(
    event_types="Image",
    model_name="MCG-NJU/videomae-base",
    num_frames=16,
    device="cpu",
)
embedding = extractor(image_event, start=image_event.start, duration=image_event.duration)
```

## Test plan
- `../.venv/bin/python -m pytest neuralset/extractors/test_video.py::test_video_requirements neuralset/extractors/test_video.py::test_huggingface_video_static_image_clip`
- `../.venv/bin/python -m mypy neuralset/extractors/video.py` currently reaches an unrelated baseline error in `neuralset/segments.py:397`; no errors are reported in `video.py`.

Made with [Cursor](https://cursor.com)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cde475910dc3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.