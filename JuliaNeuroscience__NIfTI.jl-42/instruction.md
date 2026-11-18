# Issue

**Title:** zlib: switch to CodecZlib

## Description

GZip.jl was replaced by [LibZ.jl](https://github.com/BioJulia/Libz.jl) which in turn has been replaced by [CodecZlib](https://github.com/JuliaIO/CodecZlib.jl/), so updating to the latest library. This uses the modern Julia binary packaging ecosystem, and with this PR I can use this package on my OS of choice, NixOS. All tests pass and works with my `.nii.gz` files, too

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6b0ffc0d0d96`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.