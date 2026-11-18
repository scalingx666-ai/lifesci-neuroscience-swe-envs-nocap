# Issue

**Title:** [feat] disable Singularity build/upload in CircleCI workflow

## Description

Now that ACE has been released, we need to be more agile to quickly respond to issues and user requests. The biggest bottleneck currently is building and uploading Singularity images. This requires a new token every month and we have a maximum traffic limit for builds that restricts our MIRACL releases to <5/month. In the longterm we need to find a better hosting solution and also a different way to build the sif files that does not come with restrictions. However, for now I am disabling the Singularity build/upload completely in the CircleCI workflow as a short term solution. This will make publishing new MIRACL releases easier and more agile but we will also have to manually build and upload Singularity images for the time being.

Don't approve this PR yet please. Instead, let's add the following here as well:
- [ ] new workflow for building and uploading Apptainer binaries
- [x] updated docs

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4f7f79cf89ec`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.