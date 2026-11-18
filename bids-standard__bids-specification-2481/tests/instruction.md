# Issue

**Title:** [ENH] BEP032: Move anatomical location to the electrode level

## Description

Implements the decisions we reached in the working group meeting on 2026-07-29 about anatomical location, addressing the threads on  and , and following up on  This targets `bep032-review`, so it merges into #2307 rather than into master. It is independent of #2480 and the two do not touch the same lines.

## `probes.tsv`

`associated_brain_region` and `associated_brain_region_id` become `anatomical_location` and `anatomical_location_id`. The columns now describe the probe as a whole, so the structure named there must be one that contains every recording site on the probe, and may be as coarse as the brain or a single hemisphere. The renaming also drops the assumption that a probe is in the brain, which does not hold for a probe placed in peripheral tissue, muscle, or spinal cord.

Note that this differs from what I proposed in the comment on #2307. I had suggested reading the probe-level columns as the intended surgical target. The meeting landed somewhere better: the probe-level value is whatever level of anatomical detail actually holds for the whole probe, which is a claim you can make with confidence rather than a statement of intent.

## `electrodes.tsv`

`location` becomes `anatomical_location`, and `anatomical_location_id` and `localization_method` are added. Per-contact localization belongs here, since a long shank probe passes through several structures and only the electrode table can describe that. Putting the identifier here also means that different electrode tables, distinguished by the `space-<label>` entity, can carry localizations from different atlases produced by different methods.

## Removals

`associated_brain_region_quality_type` is removed. We could not draw a clear line between its `estimated` and `proof` values in practice, and knowing the actual method, for example whether the location was histologically confirmed, is both more useful and easier to record. The free-text `localization_method` column replaces it. This also resolves the rendering problem @effigies reported, since the `(estimated|proof)` notation that was truncating the table is gone.

`reference_atlas` is removed from `probes.tsv`. The atlas is now named in a `ReferenceAtlas` field in the electrodes sidecar, which is where the terms it applies to live. A `LocalizationMethod` field is available in the same sidecar for the case where one method applies to every electrode in the file. Both are optional, and the specification states that the method must not be given in both the column and the sidecar.

## Ontology Guidance

The guidance no longer prefers species-independent terms. Terms from a species-specific atlas are acceptable and are often the better choice, and identifiers should be resolvable, either as a URI or as a prefixed identifier whose prefix identifies the source. This is what @effigies' question about whether Uberon was required or merely an example was getting at, and the answer is now stated explicitly rather than implied by an example.

## Requirement Levels

The two probe columns keep the requirement level of the columns they replace (RECOMMENDED). On the electrodes table, `anatomical_location` keeps the RECOMMENDED level that `location` had, and the two new columns are OPTIONAL, as are both sidecar fields. Happy to adjust if the group would rather set these differently.

## Verification

`bidsschematools` tests pass (81 passed, 1 skipped), as do `pre-commit` on the changed files and `npm run remark`. I confirmed that both the probes and electrodes column tables and the new sidecar table render, and that no references to the removed columns remain anywhere in `src/`.

One thing worth a second pair of eyes: I updated the example tables to use Allen Mouse Brain Atlas identifiers (`MBA:315` for isocortex, `MBA:985` for MOp, `MBA:382` for CA1). I believe those structure identifiers are right, but someone who works with the atlas daily should confirm them before this merges.

@lzehl, this is the second item from the meeting. The first is #2480.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3f1ee56b1b7f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.