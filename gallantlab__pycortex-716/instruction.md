# Issue

**Title:** ENH {Vertex,Volume}.random uses low-frequency noise

## Description

make Volume.random() and Vertex.random() yield blobby (but still random) noise. This changes default behavior (to generate low frequency noise, which looks nicer and more like real data) but preserves old behavior if you change a keyword argument. Default can be reset, but part of the intent here is to change how demo data looks in the gallery (this setting should make for nicer looking plots for some gallery demos).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ddf1a1879e35`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.