# Issue

**Title:** Keep spikeinterface importable when zarr-python v3 is installed

## Description

I am testing the zarr migration and as you know hdmf-zarr is what is keeping us from moving forward:

For testing I am making small changes here that allow me to keep spikeinterface in the environment without adding read support from version 3. Those changes are minimal:
1. Typing in the zarrextractors and in nwb
2. Handle the [string dtype](https://numpy.org/doc/stable/reference/routines.dtypes.html#numpy.dtypes.StringDType) on main ids.
3. No len() on zarr arrays in the zarr sorting extractor, v3 arrays do not have it. I  if you are curious.

This is way smaller than #4260 which is the complete thing and it does not make the zarr extractors write v3, it only keeps the import and the reading paths alive for people who have zarr 3 in the environment for another package. Loading an analyzer from a zarr folder still fails under 3 and that one really needs the migration. This will make future integration easier I feel : )

Note that 2 is useful more generally and I think we should support the new string dtype in general but I just wanted to do a surgical change here.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `32bcb0dca9f2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.