# Issue

**Title:** [ENH] BEP032: Extend sample_type and add anatomical location to samples.tsv

## Description

Follows up on the working group discussion on 2026-07-29 about the samples table. This targets `bep032-review`, so it merges into #2307 rather than into master.

Unlike the four preceding items, this one changes modality-agnostic files rather than anything under the microephys datatypes, so it deserves wider scrutiny than the rest of the BEP. Nothing here is specific to electrophysiology, and the gaps it fills were reported independently by the atlas curation work as well.

## Extending `sample_type`

The enum was taken from ENCODE Biosample Type, and it does not describe the samples this BEP deals with. There is no value for a slice, which is what a patch clamp recording is usually made from; none for the block a slice is cut from; and none for a whole organ, so an extracted brain has to be recorded as a `whole organisms`, which it is not.

This adds five values: `whole organ`, `tissue block`, `tissue slice`, `single cell`, and `cell population`. The description now says the list draws on ENCODE Biosample Type and on the openMINDS tissue sample types, rather than on ENCODE alone, and notes that further additions may be proposed.

I took only the five values that our discussion actually motivated, not the whole openMINDS list. openMINDS also has `biopsy sample`, `fluid specimen`, `hemisphere`, `nerve`, and splits cell populations into homogeneous and heterogeneous. Adding all of them is a bigger and more speculative change, and it seemed better to add what we know we need and pursue the joint list separately.

@lzehl, this is the part where you offered to raise a joint list with Tom Gillespie. Nothing here forecloses that. If a joint list comes together, these values can be reconciled with it.

## Anatomical Location on `samples.tsv`

`anatomical_location` is added as an OPTIONAL column. A sample is taken from somewhere, and until now there was no standard column to say where, even though the same information is recorded for probes and electrodes.

It holds a plain human readable name. The ontology or atlas the name comes from is documented in `samples.json` through `TermURL` and `Levels`, in the way BIDS documents any other tabular column, and the example shows that form.

An earlier version of this PR also added an `anatomical_location_id` column. @effigies pointed out on #2481 that this duplicates machinery the standard already has, and he is right, so it is gone. Every other identifier column in BIDS names an entity within the dataset rather than carrying an external ontology reference, so it would have been introducing a pattern that does not otherwise exist.

The column is defined as `anatomical_location__samples` so it can carry a sample-appropriate description. That also keeps this PR independent of #2481, which defines the probe and electrode variants. The two can merge in either order.

## Verification

`bidsschematools` tests pass (81 passed, 1 skipped), as do `pre-commit` on the changed files and `npm run remark`. I confirmed the extended enum and the new column resolve in the loaded schema and render in the samples table.

The `samples.tsv` and `samples.json` examples are updated to show a slice derived from a block, which exercises `derived_from` and the new values together. The example term resolves to `UBERON:0000955` for the brain, chosen because I am confident it is correct rather than because it is the most illustrative.

The other items from the meeting are #2480, #2481, #2482, and #2483.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b5d29029f6dc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.