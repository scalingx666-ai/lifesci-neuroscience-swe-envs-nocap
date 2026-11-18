# Issue

**Title:** Add dev container

## Description

Inspired by https://containers.dev/. Basically a standard NEURON development environment, that does not require any fiddling with env variables or similar, and in principle all NEURON CMake configurations should work out-of-the-box. Only requires the developer to install Docker or Podman, no other dependencies (which may or may not actually be installable on their machine).

See the README.md file in the `dev_container` dir for how to use this.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dc3c3f7fe4c7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.