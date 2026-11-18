# Issue

**Title:** by_teasar: stop re-searching the whole component per branch

## Description

Fixes the reported slowdown on meshes with millions of faces. On a 1.5M-vertex / 3M-face neuron, `by_teasar` went from **~108s to 1.60s** and loop memory from **459MB to 286MB**.

## The bottleneck

107s of the 108s was the invalidation loop, and 96.5s of that was one call:

```python
path = G.path(this_root, [farthest])
```

The loop zeroed each extracted path's weights so later searches could re-traverse it for free, then asked for the shortest path from the root to the next tip. `GeodesicGraph.path` stops when its last target settles — and the target is the *farthest* vertex, so every iteration settled essentially the whole component. 1920 iterations, mean path length 578 nodes, mean *new* branch 30. `ball` then re-measured the invalidation radius around the entire already-retired trunk: 70.9M node visits to do 3.3M nodes of work.

## The fix

The re-weighting isn't needed to get that answer. Because the zeroed stretches cost nothing, the search always returns "the skeleton so far, then the shortest path from the skeleton to the tip" — and that last stretch can be had directly, bounded by the branch rather than the mesh:

```python
_, nearest = G.nearest(sources=[tip], targets=skel[:n_skel])   # stops at the first target settled
seg = G.path(tip, [junction])[0]
```

Nothing is mutated, so the pristine second graph goes too and `set_weights` is no longer required of navis-fastcore. Two further O(mesh)-per-iteration costs went with it: tip selection is now a pre-sorted order walked by a pointer, and the vertex→node map is built through a lookup table rather than a dict comprehension over every vertex.

| | before | after |
|---|---|---|
| `inv_dist=2000` | ~108s | **1.60s** |
| `inv_dist=500` | — | **4.83s** |
| loop memory | 459 MB | **286 MB** |
| loop memory (`min_length`) | 564 MB | **286 MB** |

## Behaviour changes

**Tied routes.** Cable length is identical to 1e-6%; 0.14% of edges differ and carry exactly the same total length — two equally short routes to the same junction, now taken from the other end. Where a mesh has exact ties that choice *cascades* and the skeletons can differ in size. Both are valid TEASAR; documented in `_fastcore`'s list of legitimate divergences.

**`mesh_map`** now goes to the *nearest* node that invalidates a vertex rather than whichever ball reached it last, in both backends, making it independent of iteration order. On the example mesh every vertex that moves moves closer — mean geodesic distance to its node 322.9 → 120.6.

**`min_length`** applies to the finished skeleton instead of to each branch as it is extracted. Tested during extraction it could only ask whether a branch was short *as found*, so one rejected as noise came back whole the moment a later path ran through it — survival depended on extraction order. It is now a property of the result: no terminal branch shorter than `min_length` survives, iterated to a fixed point. Degree is measured undirected deliberately; over a rooted tree the node the rooting puts at the top holds a child rather than a parent, so if it is itself a tip its branch is never a leaf — which left a 60-long twig standing at `min_length=1000` for `root=0` but not for any other root.

**`edges_to_swc`** hands the ID map back as a positional array, as `forest_to_swc` already did, so remapping is `new_ids[mesh_map]`. That also removes the slow comprehension from `by_vertex_clusters`.

## Validation

- 68 tests pass. `test_teasar_backends_agree` still pins the two backends' edges to each other; new tests cover the `min_length` contract across three roots, and that each backend emits every edge exactly once.
- 40 backend configs across 5 meshes (example, fragmented, lone triangle, icosphere, two spheres) × 4 `inv_dist` × 2 roots: **0 new disagreements** — 14 agree exactly, 14 differ only at tie level (same edge count, same cable), and the 12 remaining are cascades where the two backends already disagreed before this change.
- Output on the reference mesh checked against the previous implementation end to end: identical cable, full `mesh_map` coverage, no duplicate edges.

## Notes for review

- The first commit (`import igraph and ncollpyde lazily`) was already in the working tree and is **independent of the rest** — happy to split it out if you'd rather land it separately.
- Most of the remaining loop time is now upstream in `navis-fastcore`: `nearest` and `path` allocate `O(n_nodes)` scratch per call where `ball` reuses `self.scratch`, and the two run the same Dijkstra twice. Written up in `HANDOFF-geodesic-scratch-reuse.md` in the fastcore-rs repo — roughly another 2.5x.
- Known follow-ups not taken here: `_prune_twigs` could use `navis_fastcore.prune_twigs`/`parent_dist` (its threshold is `<=` where ours is `<`, so it needs a decision); `reindex_swc` still returns a dict, costing a Python lookup per vertex in `Skeleton.reindex`; and `_prune_twigs` arguably belongs in `skeletor.post`, which already owns this concept three times over.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `687f0787205e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.