# Issue

**Title:** Add support for `raw` files in process `Apply montage`

## Description

Expand existing process **Standardize > Apply montage** to support `raw` files

For `raw` data, there is the option to apply CTF compensation (only in CTF MEG devices) and SSP/ICA projectors before applying the montages.

If SSP/ICA projectors are not applied, they are removed from the output channel file, as the channels are with montages they are not the same. Although they could, however, in that case montages should not be the way to go, but filtering or projectors themselves. 

FYI @yashvakilna, @jcmosher, @Edouard2laire, @ShahlaBakian

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d0aac8311fcb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.