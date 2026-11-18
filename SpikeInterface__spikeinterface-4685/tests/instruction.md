# Issue

**Title:** Fix remove_artifacts sparsity handling for median/average modes

## Description

## Why

Using `remove_artifacts(..., mode="median"|"average", artifacts=..., sparsity=...)`
and then calling `get_traces()` raises:

```
ValueError: shapes (M,) and (N,) not aligned
```

In `RemoveArtifactsRecordingSegment.get_traces` (median/average branch), when a
`sparsity` mask is given the traces are sparsified to the masked channels:

```python
trace_slice_values = traces[trace_slice]
if mask is not None:
    trace_slice_values = trace_slice_values[:, mask]
```

but the artifact template `self.artifacts[label]` stays **full-channel**. The
subsequent `np.dot(trace_slice_values.flatten(), artifact_slice_values.flatten())`
(and the later subtraction `traces[trace_slice][:, mask] -= ... artifact ...`)
therefore operate on mismatched channel counts. The `sparsity` block in `__init__`
only asserts that every label has a mask; it never restricts the template.

## What

Restrict the template to the sparse channels **at use time**, right where the
traces are sparsified:

```python
artifact = self.artifacts[label]
if mask is not None:
    # restrict the template to the sparse channels so that it aligns
    # with the sparsified traces (see issue #3290)
    artifact = artifact[:, mask]
```

and use this local `artifact` for the duration, the dot product, and the
subtraction.

Design notes:
- **Both artifact-provisioning paths are covered.** `self.artifacts[label]` is
  full-channel whether the template was passed in via `artifacts=` or computed by
  `estimate_templates`, so slicing at use time handles both uniformly.
- **Serialization stays correct.** The stored template and `_kwargs["artifacts"]`
  remain full-channel and `sparsity` remains full masks, so `to_dict()/load()`
  round-trips reproduce identical traces (verified). Storing a *pre-sliced* template
  in `_kwargs` instead would double-slice on reload — `__init__` would try to index
  a full-length mask into an already-1-channel template (`IndexError`) — which is
  why the slice is applied at use time, not stored.
- **No-sparsity path unchanged.** When `mask is None` the template is used as-is.

## Tests

Added `test_remove_artifacts_sparsity` covering `mode="median"` and
`mode="average"` with a `sparsity` mask and two labels (each masking a different
channel subset). It asserts that:
- `get_traces()` no longer raises,
- channels **outside** the mask are byte-identical to the clean traces
  (`np.array_equal`),
- channels **inside** the mask have the artifact subtracted (`not np.allclose`).

Before the fix this test fails at the `np.dot` with
`ValueError: shapes (1200,) and (2400,) not aligned` (600 samples × 2 sparse
channels vs 600 × 4 full channels); after the fix the whole file passes (`2 passed`).

I also verified (manually) the `to_dict()`→`load()` round-trip reproduces identical
traces, and the precomputed-`artifacts` path with sparsity — happy to add either as a
committed test if you'd like it locked in.

## Note (out of scope)

The exact minimal snippet in the issue supplies a 30-sample artifact while the
default `ms_before`/`ms_after` imply a 105-sample window, so it additionally hits a
*duration* mismatch (`105 vs 30`) that is independent of sparsity. This PR fixes the
sparsity/channel-alignment bug (the subject of #3290); after the fix the channel
dimensions match (the error, if a mis-sized template is passed, reduces to the
pre-existing duration check).

---

*Prepared with AI assistance (Claude Code): the reproduction, root-cause analysis,
fix, and test were AI-drafted; the reasoning and verification (including the rejected
store-pre-sliced approach that double-slices on reload) are documented above.*

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c33abf56fc81`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.