# Issue

**Title:** DPointNet: native CUDA operators for arbitrary-movie LGN responses

## Description

Port the generic movie LGN operators (spatial Gaussian filter, bilinear sampling, causal temporal filter, rectification and seeded spike sampling) as DpointnetLgnMovieResponse / DpointnetLgnMovieSpikes in custom_ops/_lgn_movie_ops.so, and route LGN.firing_rates(movie) through them when a GPU and the built library are available (movie_backend "auto" | "native" | "tensorflow"). Gray-screen probabilities and the TensorFlow fallback of the grating generator use the same route.

The spatial pass stages one frame per block in shared memory; on devices whose opt-in shared memory holds no whole 80 x 120 frame (V100, Pascal) it filters the frame in bands of rows and gives bitwise the same result.

RTX 3090, B32 x 500 steps x 17,400 units: 157 ms per batch of spikes (133 ms with chunk 4) against 712 ms for the TensorFlow path; rates agree to <= 2 mHz with the TensorFlow pipeline.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1b52e015312c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.