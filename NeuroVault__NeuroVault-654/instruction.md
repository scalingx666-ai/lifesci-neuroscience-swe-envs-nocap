# Issue

**Title:** RF: Use GiftiImage.to_xml over BytesIO

## Description

Saving a `GiftiImage` opens a file and writes the XML serialization of its contents. The `BytesIO` serialization hack can therefore be bypassed by directly calling `GiftiImage.to_xml()`.

Discovered this while working on nipy/nibabel#644.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e12590ff55b0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.