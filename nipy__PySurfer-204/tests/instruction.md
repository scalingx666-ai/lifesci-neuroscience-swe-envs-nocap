# Issue

**Title:** MRG: Add support for vector data in `add_data`

## Description

Eventually this will let us add vector data like `(n_vertices, 3, n_time)`, which is useful for electrophysiological estimates (e.g., MEG inverse solutions). Right now it doesn't look so good but it at least does not throw an error.

Code adapted from the  by @wmvanvliet.

Todo:

- [x] do not upsample the vectors to the high-res mesh
- [x] check `set_time_index`
- [x] fix `scale_data_colormap`
- [x] ~~split from `add_data` to `add_vectors`~~
- [x] ~~add optional `nn=None` argument~~
- [x] fix TimeViewer / `set_data_smoothing_steps`
- [x] check data addition/removal
- [x] check `time_viewer`
- [x] deal with any outstanding XXX's in code
- [x] add/test brain surface transparency (glass brain)
- [x] make sure everything is pretty
- [x] add tests

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `12a0f5d8c75e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.