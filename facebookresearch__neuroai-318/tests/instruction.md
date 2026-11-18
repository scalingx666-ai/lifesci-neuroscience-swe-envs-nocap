# Issue

**Title:** neuralset: serialize nilearn dataset fetches to avoid concurrent-download race

## Description

## Summary

Serialize nilearn dataset fetches in `neuralset` to avoid a concurrent-download race.

Parallel `FmriExtractor` jobs (exca/submitit array) fetching the same atlas/mesh/mask into a shared `~/nilearn_data` raced on nilearn's shared md5-named temp dir: when one finished and `rmtree`'d it, another's `*.part` download vanished mid-write and raised `FileNotFoundError`.

## Change

Wrap the nilearn fetches in `AtlasProjector.get_atlas`, `SurfaceProjector.get_mesh`, and `MaskProjector.get_mask` with a best-effort cross-process lock:

- Portable `O_CREAT | O_EXCL` lock file in the nilearn data dir (no `flock`, so it works on NFS/SMB).
- Stale-reclaim + timeout so a crashed holder can't wedge fetching permanently.
- Degrades to a no-op on any error / timeout — worst case falls back to today's unserialized behavior.

## Tests

Adds unit tests for serialization, stale reclaim, and graceful degradation. All 3 pass locally:

```
3 passed, 120 deselected
```

## Notes

Cherry-picked (isolated) from the `neuralset`-only commit on `facebookexternal/brainai@neuralreport/fmri-projection-tiers`; the unrelated `neuralreport` changes on that branch are intentionally excluded. Touches only `neuralset-repo/neuralset/extractors/{neuro,test_neuro}.py`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a2bdbee4b14d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.