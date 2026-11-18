# Issue

**Title:** Add FID scoring

## Description

Add FID scoring following the example here: https://github.com/lucidrains/DALLE2-pytorch/blob/3b2cf7b0bc152d826f74a90f5f6b922a8b9f7b21/train_decoder.py#L210

The `utils.sample_images` method will add all original input images to the real FID set. By default the number of these images is `n_sample_save = 8`. Each brain-guided SD image variation is added to the fake FID set. There are `n_sample_save x 4 = 32` fake images since we generate 4 per original image. The resulting FIDs for training and validation sets are logged to wandb.

Since this method is only called on the master process for now, I also added another param to control how often the sampling gets done since sampling takes so long. Ideally we'll migrate the code from this method into the actual pytorch diffusion_prior model so that it can be called by all processes and not slow down training.

These FID scores will have some variation between runs since the training images get shuffled, will look into setting that seed inside webdataset.

Also added back an old notebook that I'd deleted which shows some of the early results.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `171c32792521`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.