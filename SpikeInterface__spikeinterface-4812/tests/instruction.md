# Issue

**Title:** Don't follow symlinks when storing extractor paths

## Description

This is the solution for the failing tests on #4809 @alejoe91.

As mentioned, the reason the tests fail there is that with the recent changes on gin the annexed files are stored locked, as symlinks, and the `resolve()` on the extractor kwargs follows them. So the Intan path goes from a name like `intan/intan_fpc_test_231117_052630/info.rhd` to a name like `.git/annex/objects/vf/J8/MD5E-s8082--faf8e5811c5e68da6c2fec030f6bb0f9.rhd/MD5E-s8082--faf8e5811c5e68da6c2fec030f6bb0f9.rhd`. After unpickling neo no longer sees a file named `info.rhd` so it doesn't look for the `amplifier.dat` and `time.dat` files next to it and the recording comes back with 0 samples (NeuroNexus has the same problem with its `_data.xdat` file).

The solution is to use `absolute()` instead of `resolve()` which is what most of the extractors already do. This PR does that for the 12 places that used `resolve()`.

I think that relative dumps and containers have the same problem but solving them needs more than `absolute()` but this will have to wait. I will open an issue when I have some time.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `93c612f51cca`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.