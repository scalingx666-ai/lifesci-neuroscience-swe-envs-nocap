# Issue

**Title:** Process to perform automatic MEG automatic artifact rejection, based on ArtifactScanTool

## Description

This PR has as goal to recreate the AUTO method for MEG trial rejection present in [ArtifactScanTool](https://github.com/nichrishayes/ArtifactScanTool).

This automatic method is based on thresholding the peak-to-peak amplitude (p2p) and the gradient of the signal using `N` times the median absolute deviations (MAD) from the median of their respective distributions across segments (for continuous files) or trials (for imported data).

![image](https://github.com/brainstorm-tools/brainstorm3/assets/8238803/2b7e4c64-f473-48ca-b090-762fd690edc2)


Done with @aiwiesman

- [x] Port as Brainstorm process
- [x] Check and compare results between implementations
- [x] Update GUI
- [x] Update information in [Artifacts tutorial](https://neuroimage.usc.edu/brainstorm/Tutorials/ArtifactsDetect#Other_detection_processes)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5faabfd6734c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.