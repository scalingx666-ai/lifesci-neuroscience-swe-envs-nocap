# Issue

**Title:** Optional img2img input for diffusion reconstruction

## Description

updated my jupyter notebook with jimgoo’s latest contributions, also fixed problem with wandb executing for each gpu instead of just the master gpu (but only for my notebook, not jimgoo's _combo.py script)

utils.reconstruct_from_clip() is an alternative to utils.sample_images() that can take img2img reference input, as used in the Brain_to_Image scripts. 

grid of images now has white background and legible plot titles

I kept the train_combined.py unchanged and didnt mess with it so as to preserve others workflows, although it would still need to be adapted to handle the new img2img feature

added rng seed to data loaders

allow user to specify num_train in get_dataloaders() via num_samples argument (useful if wanting to not use the full dataset, for testing purposes)

separated jimgoo’s main-conda.slurm from my main-singularity.slurm

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1cbe7a7ed148`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.