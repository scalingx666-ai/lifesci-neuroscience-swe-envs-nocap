# Issue

**Title:** Propagate shared annotations in aggregate_channels

## Description

.

`ChannelsAggregationRecording` propagates properties from its child recordings but propagates no annotations at all, so metadata that every child agrees on is silently lost when you aggregate. The most visible case is `is_filtered`, which `BaseRecording.__init__` sets to `False` on the new aggregate, so aggregating two filtered recordings gave you an aggregate claiming to be unfiltered.

This adds annotation propagation just after the existing property block. The rule implemented is that an annotation is propagated only when it is present in every recording in the list and all of the recordings agree on its value. Anything missing from even one recording, and anything where the values differ, is dropped rather than guessed at. This is the same definition of shared that `UnitsAggregationSorting` in `unitsaggregationsorting.py` already uses for sortings, so the two aggregation paths now behave consistently.

The alternative worth naming is a union rule, where an annotation held by only some recordings is still carried over from whichever ones have it, possibly collected into a per recording list. I did not take that route because the aggregate would then be asserting metadata that is not true of all of its channels, and because it would diverge from the sorting sibling. Happy to switch if you prefer the union semantics.

Two small deliberate differences from the sorting version. First, the equality check uses `np.array_equal` rather than building an array of all the values and comparing with `==`. The sibling idiom is fragile once an annotation value is itself an array, since `np.array` on unequal length values either raises or yields an object array, and `==` on arrays returns an elementwise result instead of a single bool. The comparison is wrapped so that a value which cannot be compared at all, such as a ragged object array, is treated as not shared and skipped rather than crashing the aggregation. Second, the annotation is set with `overwrite=True`, which is required because `BaseRecording.__init__` has already set `is_filtered` by the time this loop runs and `set_annotation` otherwise raises on an existing key. Sortings do not hit this because `BaseSorting.__init__` sets no default annotations. The value stored is a copy, so the aggregate never shares mutable state with its first child.

On `name`, which is a main annotation, I chose to include it rather than special case it out. It is only ever present when someone has explicitly set it, since `BaseExtractor.name` falls back to the class name when the annotation is absent, so this only fires when every child carries the same explicit name. The repr still shows the class alongside it, as in `MyRecording (ChannelsAggregationRecording)`, so the aggregate is not disguised as one of its children, and splitting then re-aggregating now round trips the name instead of dropping it. Excluding it would have been an extra special case that neither the issue nor the sorting sibling asks for, but say the word and I will exclude it.

One note on the issue text. `probe_planar_contour` is no longer a recording annotation on main, it now lives on the `probeinterface.Probe` object, and `set_probegroup` no longer writes any annotation, so there is nothing for this change to clobber there. I placed the new block before the probegroup aggregation anyway, and added a test asserting that per probe planar contours and channel locations are unchanged after aggregating recordings that carry probes.

Tests added to `test_channelsaggregationrecording.py` cover an annotation shared by all children being propagated, one present everywhere with differing values being dropped, one present in only some children being dropped in both list orders, array valued and ragged annotations being handled without raising, the propagated value being a copy rather than a reference into the first child, and the probe metadata regression guard.

Reverting the source to main makes three of the new tests fail. The whole file passes after at 19, `test_unitsaggregationsorting.py` passes at 8, and the entire `core/tests/` suite runs to completion at 329 passed and 5 skipped. `black --line-length 120` reports both files unchanged.

Disclosure: this change was prepared with AI assistance. I have reviewed and tested it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dbe2e7539ab6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.