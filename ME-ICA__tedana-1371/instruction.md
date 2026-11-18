# Issue

**Title:** account for user-provided nonbinary masks

## Description

I just tried to run one of my existing scripts after merging #1305. I was using an adaptive mask as the input for the `--mask` parameter. I got the following error (with some of the full paths trimmed)

```
  File "tedana/tedana/workflows/tedana.py", line 744, in tedana_workflow
    io_generator.save_file(masksum_denoise, "adaptive mask img")
  File "tedana/tedana/io.py", line 282, in save_file
    self.save_img(data, name, mask=kwargs.get("mask", None))
  File "tedana/tedana/io.py", line 349, in save_img
    img = masking.unmask(data.T, mask)
          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "nilearn/masking.py", line 968, in unmask
    mask, affine = load_mask_img(mask_img)
                   ^^^^^^^^^^^^^^^^^^^^^^^
  File "nilearn/masking.py", line 82, in load_mask_img
    raise ValueError(
ValueError: Given mask is not made of 2 values: [0 1 2 3]. Cannot interpret as true or false.
```
This wasn't an issue in the past, but I think the new usage of `unmask` requires the mask to be binary. 

I'll defer to others on deciding whether making sure a useful, but undocumented functionally still works is considered a bug fix.

Changes proposed in this pull request:

- When a user provided mask is loaded, all values <=0 are defined as `False` and all values >0 are defined as `True`
  - I documented this in a comment in the code, but I'm not sure if we should document it in the logger. I think this was effectively what the functionality always was

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2967fe32b11c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.