# Issue

**Title:** feat: multi-mip sharded downsampling

## Description

Multi-mip sharded downsampling. Previously, only a single mip could be generated at a time.

The previous algorithm read 1-2 z chunks at a time, downsampled, and built a single shard. This allowed for reasonable memory consumption.

This new algorithm reads 1-2 chunks at a time, downsamples them, and stores them compressed in a dictionary. With more mip levels, the amount of image data grows tremendously, but for lossy compressed images or segmentation, compression will give a sufficient compression factor for this to be reasonable. E.g. segmentation can compress hundreds of times, lossy images can compress maybe 4-5x.

For losslessly compressed images, expect very large memory usage if using num_mips > 2. E.g. 16 + 4 + 1 = 21 shards * 0.7 = 14.7x.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5ff07bda53d6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.