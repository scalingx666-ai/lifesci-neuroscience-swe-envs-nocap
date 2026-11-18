# Issue

**Title:** Update installation instructions for Macs, min version of rastermap

## Description

1. By setting the env var `CONDA_SUBDIR=osx-64`, I think that using iTerm with Rosetta is no longer needed. Without it, I was able to `pip install "suite2p[all]"` on my Mac M1 and run it with images in an h5 file (an nwb file) just fine. So I simplified the instructions for Mac M1 machines. 

2. I reverted the note about scanimage-tiff-reader mac incompatibility. The latest release 1.4.1.4 adds support for Mac M1. See https://gitlab.com/vidriotech/scanimagetiffreader-python/-/commit/9f4de14aa3186b0643608c5d203890f2ca1a8172 .  I don't know if there was a separate issue with non-M1 macs, but I could install suite2p on both a Mac with Apple Silicon and one with an Intel processor. Fix #981.

3. I updated the minimum version of rastermap to one that supports `from rastermap.rastermap import Rastermap`

4. My editor removes trailing spaces at the end of lines automatically...

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9ab4ca1c510f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.