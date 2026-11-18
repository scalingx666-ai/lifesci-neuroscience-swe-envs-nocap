# Issue

**Title:** FIX save_image() dpi

## Description

When setting different DPI in `rcParams` saved images are wrongly scaled (see below). I suspect it's because unlike matplotlib's `imsave`, `PySurfer`  does not use `dpi` when saving the image. This PR fixes this.

![old rh wrong](https://user-images.githubusercontent.com/145771/40877796-8ddec8d0-6654-11e8-9c29-8f96cb944dac.png)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `baca85392eae`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.