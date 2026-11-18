# Issue

**Title:** Add a GIN download backend and assorted neuralset / neuraltrain fixes

## Description

neuralfetch

- `Gin` downloads from gin.g-node.org. GIN's anonymous HTTPS clone URL does
  not serve `.git/config`, so `datalad clone` marks origin annex-ignore and
  every later `datalad get` exits successfully having fetched nothing, leaving
  a tree of ~60-byte pointer files. The backend registers
  `.../raw/<branch>/<relpath>` against each annex key and pulls content with
  `git annex get --from=web`.
- `Datalad._expand_folders` is factored out of `_download`, so both backends
  resolve `folders` the same way.

neuralset

- `AggregatedExtractor` classifies sub-extractors by frequency rather than by
  `BaseStatic` inheritance, since a static extractor configured with a non-zero
  frequency is a temporal stream. The common frequency propagates to the
  aggregate.
- `Segmenter.padding` accepts `"auto"`, which its own docstring and
  `_get_pad_lengths` already describe and implement.
- `prepare_extractors` prepares the non-Slurm extractors after the Slurm
  futures complete: `ChannelPositions` wraps `MneRaw`, so preparing it first
  relaunches work for a cache uid already in flight.
- `_remove_incomplete_segments` tests membership against the set of invalid
  indices instead of sorting it once per segment.
- `MneRaw` excludes `channel_order` from the cache uid, alongside the other
  options applied after loading.
- `HuggingFaceVideo._get_data` leaves the `neuralset` logger's level alone.
- `Study.query` selects timelines before loading rather than filtering rows
  after it; the docstring said the opposite.

neuraltrain

- `ChannelMerger` is a `BaseBrainModelConfig`, and `BaseBrainModelConfig` and
  `BrainModelBuildContext` are exported from `neuraltrain.models`, so
  `project_example` builds its model through `build_from_context`.
- W&B login runs on global rank zero only. Under srun every rank reaches it,
  and concurrent logins race before Lightning's own rank-zero guard applies.

Made with [Cursor](https://cursor.com)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fcaa01a4893f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.