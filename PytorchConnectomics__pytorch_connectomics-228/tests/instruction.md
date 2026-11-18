# Issue

**Title:** tutorials/neuron_seg256nm: BANIS+ on low-res MICrONS (256x256x320 nm)

## Description

Adds `tutorials/neuron_seg256nm/` (`banis+.yaml`, `overfit.yaml`, `dataset.yaml`, `README.md`): BANIS+ MedNeXt-S on downsampled MICrONS, inheriting `tutorials/neuron_segneuron/banis+.yaml` (ABISS-layout affinities, speed knobs) with a 128 cube, 10-voxel long-range offsets on every axis, label erosion 1 and `aug_light`.

`scripts/validate_tutorial_configs.py --glob 'tutorials/neuron_seg256nm/*.yaml'` reports 3 configs validated. Nothing has been trained with these configs.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3b88dc32507a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.