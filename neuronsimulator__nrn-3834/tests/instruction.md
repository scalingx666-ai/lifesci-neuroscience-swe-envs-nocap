# Issue

**Title:** neuronapi: add nrn_sectionlist_to_array for batched section-list access

## Description

Adds `nrn_sectionlist_to_array` to the public C API for batched, whole-list access to a section list.

## What and why

Iterating a section list from a binding goes one FFI crossing per section through the `nrn_sectionlist_iterator_*` functions. That is right for streaming, but for a **whole-list snapshot** -- building a `Section*` array, e.g. an `allsec` gather and every rebuild when the topology changes -- it is a crossing per section where a single crossing would do. For a several-thousand-section model that is thousands of crossings versus one.

```c
int nrn_sectionlist_to_array(nrn_Item* sl, Section** buf, int maxlen);
```

It fills `buf` with up to `maxlen` sections in one crossing and returns the **total** live-section count, so a return greater than `maxlen` means the buffer was too small and the snapshot is truncated. Call once with `buf = NULL`, `maxlen = 0` to get the total first, then size the buffer to it -- no separate count function and no retry loop. It operates on any section list handle (`nrn_allsec()` or `nrn_sectionlist_data(obj)`), so it works for a whole `SectionList` too, not just `allsec`. Semi-deleted sections (no `Section`, or a freed `prop`) are skipped, the same ones `SectionListIterator` skips, but unlike the iterator it is read-only and does not prune them.

## On the earlier revision

This replaces the two-function version (`nrn_sectionlist_count` + `nrn_sectionlist_to_array`). You were right on both counts: **staleness is not what this is for** -- `structure_change_cnt` is the staleness signal, and myneuron already watches it -- so the "counting as a staleness check" justification was wrong and is gone. And the separate `count` bought nothing, since `to_array(sl, NULL, 0)` already returns the total in one pass. What remains is purely the batched-retrieval win.

## Changes

- `src/nrniv/neuronapi.h`, `src/nrniv/neuronapi.cpp`: declare + define the one function.
- `docs/capi.rst`: documented it, with a C snippet showing the count-pass-then-fill pattern, and a note that snapshot staleness is `structure_change_cnt`'s job.
- `test/api/sectionlist_to_array.cpp`: checks the array against the one-at-a-time iterator element-for-element, for both an `allsec` list and a `SectionList` subtree; that the count pass matches; that a buffer shorter than the list truncates while still returning the true total; and null-list safety.

Rebased onto master (the earlier conflict is resolved). Same structure as #3810. `make format-pr` clean (clang-format 12.0.1, cmakelang 0.6.13). `ctest -R sectionlist_to_array` passes; the `api::` group is green.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `60eb5352ed94`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.