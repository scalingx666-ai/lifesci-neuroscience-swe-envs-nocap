# Issue

**Title:** Added plot_fslr() function and a yerkes19 fetcher

## Description

I added a plot_fslr() function, which basically is a generalization of the plot_conte69() function. This function asks the user which surface atlases he wants to use. For human brains, this atlas will more often than not be the conte69 atlas. For macaque, however, other atlases exist. One of these atlases is the Yerkes19 atlas (Donahue et al., 2016, J. Neurosci.).

I also added a fetcher function: fetch_yerkes19() to download this Yerkes19 atlas.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `79936ea4b9b9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.