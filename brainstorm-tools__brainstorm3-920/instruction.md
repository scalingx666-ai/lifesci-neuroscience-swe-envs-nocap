# Issue

**Title:** Run resection identification using Docker container

## Description

This PR introduces the execution of the `resection-identification` plugin by transitioning it to run within a Docker container, utilizing the recent container-based plugin support in Brainstorm ().

Related forum discussion: https://neuroimage.usc.edu/forums/t/automatic-resection-identification/56589/16

# Usage
- Open Docker Desktop and keep it running in the background. Refer to the **Notes** section in the forum post above for some additional recommended setup.
- Install the `Anatomy > resection-identification` plugin in Brainstorm to load the image and start the container.
- Follow steps as mentioned in the tutorial (https://neuroimage.usc.edu/brainstorm/Tutorials/ResectionIdentification)

# Checklist
- [x] Test on Windows 11 (w/ and w/o NVIDIA GPU)
- [x] Test on Mac (Apple Silicon) - needs more testing (see  - kept for future PR)
- [x] Test on Linux (w/ and w/o NVIDIA GPU)
- [x] Update tutorial page with info on the containerization

FYI: @tmedani @ajoshiusc @Edouard2laire

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `32994a8f62c5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.