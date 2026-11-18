# Issue

**Title:** Fix CRAN dependency installation in the Docker image

## Description

The DockerHub build for `5.23.0` could not read the HTTP CRAN package index. Both dependency installs emitted warnings and the build stopped later when `R CMD build` tried to load `knitr`. [Failing job](https://github.com/brainflow-dev/brainflow/actions/runs/34781130221/job/103788224875#step:4:1)

- Install `knitr` and `reticulate` from the HTTPS CRAN mirror.
- Include the libpng headers needed by reticulate's `png` dependency.
- Load both namespaces during the install layer so a missing dependency fails that layer.

`git diff --check` and the shell syntax check for the R dependency step passed.

## Verification

- The full `5.23.0` Docker image build passed using this Dockerfile. [Image build](https://github.com/brainflow-dev/brainflow/actions/runs/42473114566/job/128708318240)
- The independent Ubuntu 20.04 check installed both R dependencies and built the R package. [R package build](https://github.com/brainflow-dev/brainflow/actions/runs/42473114566/job/128708318533)

## Unix CI

CMake now fetches GoogleTest `v1.17.0` through a shallow Git clone. The previous GitHub archive download failed during native configuration. [Failing macOS job](https://github.com/brainflow-dev/brainflow/actions/runs/42472028313/job/128704810453)

The Unix workflow passed on macOS and Ubuntu after the change. [Passing run](https://github.com/brainflow-dev/brainflow/actions/runs/42479730202)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2efa9b094466`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.