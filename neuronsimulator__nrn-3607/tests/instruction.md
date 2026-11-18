# Issue

**Title:** Fix GPU build and add NVHPC CI

## Description

This PR does a couple of things:

- fixes the build so NEURON compiles and runs under NVHPC
- modifies the tests so that some have more relaxed accuracy thresholds on NVHPC, while others are disabled (notably, the LFP test segfaults)
- adds a CI that runs on a custom runner, which has the necessary software and hardware to build and run NEURON under NVHPC (i.e. with GPU capabilities). The underlying runner is a Ubuntu 24.04 LTS container with an NVIDIA GPU.

With the above, as long as the custom runner is available, we will always be certain that NEURON successfully builds and runs with its GPU features enabled.

Note that the documentation detailing how to setup the runner is available in [this repo](https://github.com/neuronsimulator/nrn-nvhpc-ci/) (only accessible to org members).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `81b99c0dd418`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.