# Issue

**Title:** Fix batch processing for inference and add auto-matching test images

## Description

- Fix IndexError in batch processing by preserving batch dimensions in _apply_decode_mode and _apply_postprocessing
- Fix glob pattern handling in read_volume for TIFF files
- Add automatic test_image matching in neuroglancer visualization when prediction files are provided
- Improve batch size detection in _write_outputs to handle 2D and 3D data correctly

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5d4ba35e8282`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.