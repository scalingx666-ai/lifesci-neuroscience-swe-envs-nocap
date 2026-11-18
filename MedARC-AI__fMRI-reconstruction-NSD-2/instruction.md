# Issue

**Title:** Train/val split counts and DDP tweaks for cluster

## Description

For the train/val split sample counts for the [NSD webdataset](https://huggingface.co/datasets/pscotti/naturalscenesdataset/tree/main/webdataset) , we've been using `num_train = 24983` and `num_val = 492` in the code. However these apply only to dataset commits up to `9947586`, before @PaulScotti updated in January. After that commit, there is a metadata file that contains these counts. The stability cluster has the latest version of this dataset. I've updated `utils.get_dataloaders` so that it accepts an URL for this metadata file. If no URL is given, it falls back to the old counts.  This method also returns these counts so that they can be used downstream for things like the OneCycleLR.

For DDP, I added a `train_combo.py` script which is basically the old `train_prior_with_voxel2clip.py` updated to work with DDP. The main thing is to use the unwrapped pytorch models via `model.module` during validation on the master process to prevent hanging. I also made the validation DataLoader use the single device batch size and only one worker since it runs on the master process, this way we the full set of validation samples each epoch.

The reason for the new `train_combo.py` script instead of using the old one is that I was developing on the cluster with slurm, so running a notebook that gets converted to a python file wasn't feasible. If I modified the converted python script, there would be no way to get the changes back into the notebook. I made a best effort to update the notebook so that it at least works, but `train_combo.py` is the only thing I've tested.

Other random things:

- bumped the version of diffusers in the conda `environment.yaml` so that sampling images with the SD image variation pipeline works
- added a slurm script to run training inside the above conda environment 
- DataLoaders now return the sample keys in addition to voxels and images - useful for tracking individual samples and verifying loaders are loading the data we think

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `884374506fca`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.